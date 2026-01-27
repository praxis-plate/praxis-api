# Wallet Service

The wallet service manages user coin balances and transactions in the Praxis application. It provides a complete system for handling internal currency (COIN) operations.

## Architecture

The wallet service follows a modular architecture with clear separation of concerns:

```
WalletService (Coordinator)
├── WalletTransactionProcessor (Transaction handling)
├── WalletManager (Wallet management)
├── WalletCalculator (Balance calculations)
└── WalletValidator (Validation logic)
```

### Components

#### WalletService
Main service that coordinates all wallet operations. Acts as a lightweight facade for the underlying components.

#### WalletTransactionProcessor
Handles transaction processing with proper validation, idempotency checks, and database transactions.

#### WalletManager
Manages wallet lifecycle - creation, lookup, and ensuring wallet existence.

#### WalletCalculator
Performs balance calculations for different transaction types, ensuring wallet invariants are maintained.

#### WalletValidator
Validates wallet invariants, balance sufficiency, and transaction idempotency.

## Currency System

- **Currency**: `COIN` (internal application currency)
- **Balance Structure**:
  - `balance`: Total coins owned by user
  - `available`: Coins available for spending
  - `held`: Coins temporarily held (e.g., during processing)
- **Invariant**: `balance = available + held`

## Transaction Types

### Core Operations
- **`topUp`**: Add coins to wallet (purchased with real money)
- **`buy`**: Purchase courses using available coins
- **`adjustment`**: Manual balance adjustments (admin operations)

### Advanced Operations
- **`hold`**: Temporarily hold coins (moves from available to held)
- **`capture`**: Finalize held transaction (removes from held and balance)
- **`release`**: Release held coins back to available
- **`refund`**: Return coins for buy/capture transactions
- **`reversal`**: Reverse any transaction type

## API Methods

### WalletService Methods

```dart
// Get current wallet balance
Future<UserWallet> getBalance(Session session)

// ⚠️ Add coins to wallet (INTERNAL USE ONLY - no payment verification)
Future<CoinTransactionDto> topUp(Session session, CreateCoinTransactionRequest request)

// Purchase courses with coins
Future<CoinTransactionDto> buy(Session session, CreateCoinTransactionRequest request)

// Get transaction history with pagination
Future<List<CoinTransactionDto>> getHistory(Session session, {int? limit, int? offset})
```

**Important Notes**:
- `topUp()` immediately adds coins without payment verification
- Suitable for admin operations, testing, and internal transfers only
- For real user payments, external payment integration is required

### WalletEndpoint Methods

The REST API endpoints mirror the service methods:

- `GET /wallet/balance` - Get wallet balance
- `POST /wallet/topup` - ⚠️ Add coins to wallet (INTERNAL USE ONLY)
- `POST /wallet/buy` - Purchase with coins
- `GET /wallet/history` - Get transaction history (supports `limit` and `offset` parameters)

**Security Warning**: The `topup` endpoint immediately adds coins without payment verification. This should only be used for:
- Admin operations (manual coin grants)
- Testing and development
- Internal system transfers

For real user payments, implement external payment provider integration.

## Initialization

Wallets are automatically created when users register through the `onAfterAccountCreated` callback in `server.dart`. No manual initialization is required.

## Transaction Flow

### Top-Up Flow

⚠️ **IMPORTANT**: Current `topUp` implementation immediately adds coins without real payment verification. This is suitable for internal operations but NOT for real user payments.

**Current behavior**:
1. User initiates top-up request
2. Validation ensures positive amount
3. Transaction processor **immediately** creates transaction and adds coins
4. Wallet calculator adds amount to both `balance` and `available`
5. Database transaction commits changes

**Limitations**:
- ❌ No integration with external payment providers
- ❌ No payment verification step
- ❌ Coins are added before actual money is received
- ✅ Suitable only for: admin operations, testing, internal transfers

**For real user payments**, a two-phase approach is needed:
1. **Phase 1**: Create payment intent → redirect to external payment service
2. **Phase 2**: Webhook confirmation → add coins to wallet

### Purchase Flow
1. User initiates purchase request
2. Validation ensures sufficient available balance
3. Transaction processor creates idempotent transaction
4. Wallet calculator subtracts amount from both `balance` and `available`
5. Database transaction commits changes

## Error Handling

### Validation Errors
- Insufficient balance: `ValidationException` with field `'available'`
- Invalid amount: `ValidationException` with field `'amount'`
- Wallet invariant violation: `ValidationException` with field `'balance'`

### Idempotency
All transactions are idempotent using `transactionKey`. Duplicate requests with the same key return the original transaction without side effects.

### Race Conditions
- Wallet updates use optimistic locking with version numbers
- Transaction conflicts are handled gracefully
- Concurrent operations are properly serialized

## Security

### Authentication & Authorization
- All operations require authenticated session
- User can only access their own wallet
- Wallet operations are isolated by `authUserId`

### Transaction Key Security
**Who creates transactionKey**: The client application (Flutter app) is responsible for generating unique transaction keys.

**Security implications**:
- ⚠️ **Vulnerability**: Clients can potentially reuse transaction keys maliciously
- ✅ **Protection**: Server validates transaction key uniqueness per user
- ✅ **Idempotency**: Duplicate keys return original transaction without side effects

**What happens with malicious transaction keys**:

1. **Reusing own transaction key**: Returns the original transaction (safe idempotency)
2. **Using another user's transaction key**: Blocked by user isolation - each user has separate transaction key namespace
3. **Reusing key with different parameters**: Throws `ValidationException` with detailed error message

**Example attack scenarios**:
```dart
// Scenario 1: User tries to reuse their own transaction key
// First request: topUp 1000 COIN with key "my-key-123"
// Second request: topUp 5000 COIN with key "my-key-123" 
// Result: Returns original 1000 COIN transaction (safe)

// Scenario 2: User tries to reuse key with different type
// First request: topUp 1000 COIN with key "my-key-123"
// Second request: buy 1000 COIN with key "my-key-123"
// Result: ValidationException("Transaction key already used with different type")
```

**Best practices for transaction key generation**:
```dart
// Recommended pattern: operation_userId_timestamp_random
final transactionKey = 'topup_${userId}_${DateTime.now().millisecondsSinceEpoch}_${uuid.v4()}';

// For course purchases: include course ID for uniqueness
final transactionKey = 'buy_course_${courseId}_${userId}_${timestamp}_${uuid.v4()}';
```

### Additional Security Measures
- Wallet invariants are strictly enforced
- Optimistic locking prevents race conditions
- All amounts are validated for positive values
- Transaction types are strictly validated

## Database Schema

### UserWallet Table
```sql
- id: Primary key
- auth_user_id: User identifier (UUID)
- balance: Total coins (integer)
- available: Available coins (integer)
- held: Held coins (integer)
- currency: Always 'COIN'
- version: Optimistic locking version
- created_at/updated_at: Timestamps
```

### CoinTransaction Table
```sql
- id: Primary key
- auth_user_id: User identifier (UUID)
- transaction_key: Idempotency key
- type: Transaction type (topUp, buy, etc.)
- status: Always 'posted'
- amount: Transaction amount
- currency: Always 'COIN'
- related_entity_id: Optional reference
- reversal_of_transaction_id: For reversals
- reason: Optional description
- metadata: Optional JSON data
- created_at: Timestamp
```

## Usage Examples

### Top-Up Wallet
```dart
final request = CreateCoinTransactionRequest(
  type: 'top_up',
  amount: 1000, // 10.00 COIN (amounts in cents)
  currency: 'COIN',
  transactionKey: 'topup_${userId}_${timestamp}',
);

final transaction = await walletService.topUp(session, request);
```

### Purchase Course
```dart
final request = CreateCoinTransactionRequest(
  type: 'buy',
  amount: 500, // 5.00 COIN
  currency: 'COIN',
  transactionKey: 'buy_course_${courseId}_${userId}_${timestamp}',
  relatedEntityId: courseId,
);

final transaction = await walletService.buy(session, request);
```

### Get Balance
```dart
final wallet = await walletService.getBalance(session);
print('Available: ${wallet.available} COIN');
print('Total: ${wallet.balance} COIN');
```

## Testing

The wallet service includes comprehensive validation and error handling. All operations are tested for:
- Happy path scenarios
- Edge cases (zero balance, insufficient funds)
- Race conditions and concurrency
- Idempotency guarantees
- Wallet invariant preservation