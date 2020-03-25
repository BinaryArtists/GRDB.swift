// Fixits for changes introduced by GRDB 5.0.0
// swiftlint:disable all

#if os(iOS)
import UIKit
#endif

extension AnyFetchRequest {
    @available(*, unavailable, message: "Define your own FetchRequest type instead.")
    public init(_ prepare: @escaping (Database, _ singleResult: Bool) throws -> (SelectStatement, RowAdapter?))
    { preconditionFailure() }
}

@available(*, unavailable, message: "Custom reducers are no longer supported")
public struct AnyValueReducer<Fetched, Value>: _ValueReducer {
    public var isObservedRegionDeterministic: Bool
    { preconditionFailure() }
    
    public init(fetch: @escaping (Database) throws -> Fetched, value: @escaping (Fetched) -> Value?)
    { preconditionFailure() }
    
    public init<Base: _ValueReducer>(_ reducer: Base) where Base.Fetched == Fetched, Base.Value == Value
    { preconditionFailure() }
    
    public func fetch(_ db: Database) throws -> Fetched
    { preconditionFailure() }
    
    public func value(_ fetched: Fetched) -> Value?
    { preconditionFailure() }
}

extension AssociationAggregate {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> AssociationAggregate<RowDecoder>
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> AssociationAggregate<RowDecoder>
    { preconditionFailure() }
}

extension DatabaseFunction {
    @available(*, unavailable, renamed: "callAsFunction(_:)")
    public func apply(_ arguments: SQLExpressible...) -> SQLExpression
    { preconditionFailure() }
}

extension DatabaseMigrator {
    @available(*, unavailable, renamed: "registerMigration(_:migrate:)")
    public mutating func registerMigrationWithDeferredForeignKeyCheck(
        _ identifier: String,
        migrate: @escaping (Database) throws -> Void)
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Wrap this method: reader.read(migrator.appliedMigrations) }")
    public func appliedMigrations(in reader: DatabaseReader) throws -> Set<String>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Wrap this method: reader.read(migrator.hasCompletedMigrations) }")
    public func hasCompletedMigrations(in reader: DatabaseReader) throws -> Bool
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Prefer reader.read(migrator.completedMigrations).contains(targetIdentifier)")
    public func hasCompletedMigrations(in reader: DatabaseReader, through targetIdentifier: String) throws -> Bool
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Prefer reader.read(migrator.completedMigrations).last")
    public func lastCompletedMigration(in reader: DatabaseReader) throws -> String?
    { preconditionFailure() }
}

extension DatabasePool {
    #if os(iOS)
    @available(*, unavailable, message: "Memory management is now enabled by default. This method does nothing.")
    public func setupMemoryManagement(in application: UIApplication) { preconditionFailure() }
    #endif
}

extension DatabaseQueue {
    #if os(iOS)
    @available(*, unavailable, message: "Memory management is now enabled by default. This method does nothing.")
    public func setupMemoryManagement(in application: UIApplication) { preconditionFailure() }
    #endif
}

extension FetchRequest {
    @available(*, unavailable, message: "Use makePreparedRequest(_:forSingleResult:) instead.")
    func prepare(_ db: Database, forSingleResult singleResult: Bool) throws -> (SelectStatement, RowAdapter?)
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchCount) instead")
    public func observationForCount() -> ValueObservation<ValueReducers.Unavailable<Int>>
    { preconditionFailure() }
}

extension FetchRequest where RowDecoder: DatabaseValueConvertible {
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchAll) instead")
    public func observationForAll() -> ValueObservation<ValueReducers.Unavailable<[RowDecoder]>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchOne) instead")
    public func observationForFirst() -> ValueObservation<ValueReducers.Unavailable<RowDecoder?>>
    { preconditionFailure() }
}

extension FetchRequest where RowDecoder: FetchableRecord {
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchAll) instead")
    public func observationForAll() -> ValueObservation<ValueReducers.Unavailable<[RowDecoder]>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchOne) instead")
    public func observationForFirst() -> ValueObservation<ValueReducers.Unavailable<RowDecoder?>>
    { preconditionFailure() }
}

extension FetchRequest where RowDecoder: _OptionalProtocol, RowDecoder.Wrapped: DatabaseValueConvertible {
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchAll) instead")
    public func observationForAll() -> ValueObservation<ValueReducers.Unavailable<[RowDecoder.Wrapped?]>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchOne) instead")
    public func observationForFirst() -> ValueObservation<ValueReducers.Unavailable<RowDecoder.Wrapped?>>
    { preconditionFailure() }
}

extension FetchRequest where RowDecoder == Row {
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchAll) instead")
    public func observationForAll() -> ValueObservation<ValueReducers.Unavailable<[Row]>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(request.fetchOne) instead")
    public func observationForFirst() -> ValueObservation<ValueReducers.Unavailable<Row?>>
    { preconditionFailure() }
}

extension SQLExpression {
    @available(*, unavailable, message: "Use SQLLiteral initializer instead")
    public var sqlLiteral: SQLLiteral
    { preconditionFailure() }
}

@available(*, unavailable, message: "Build literal expressions with SQLLiteral.sqlExpression instead.")
public struct SQLExpressionLiteral: SQLExpression {
    public var sql: String { preconditionFailure() }
    public var arguments: StatementArguments { preconditionFailure() }
    
    public init(sql: String, arguments: StatementArguments = StatementArguments())
    { preconditionFailure() }
    
    public init(literal sqlLiteral: SQLLiteral)
    { preconditionFailure() }
    
    public func expressionSQL(_ context: inout SQLGenerationContext, wrappedInParenthesis: Bool) -> String
    { preconditionFailure() }
    
    public func qualifiedExpression(with alias: TableAlias) -> SQLExpression
    { preconditionFailure() }
}

extension SQLLiteral {
    @available(*, unavailable, message: "Use SQL interpolation instead.")
    public func mapSQL(_ transform: @escaping (String) -> String) -> SQLLiteral
    { preconditionFailure() }
}

@available(*, unavailable, renamed: "SQLAssociativeBinaryOperator")
typealias SQLLogicalBinaryOperator = SQLAssociativeBinaryOperator

extension SQLSpecificExpressible {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> SQLSelectable
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> SQLSelectable
    { preconditionFailure() }
}

extension Statement {
    @available(*, unavailable, renamed: "setUncheckedArguments(_:)")
    public func unsafeSetArguments(_ arguments: StatementArguments)
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "validateArguments(_:)")
    public func validate(arguments: StatementArguments) throws
    { preconditionFailure() }
}

extension TableRecord {
    @available(*, unavailable, message: "Use ValueObservation.tracking(MyRecord.fetchCount) instead")
    public static func observationForCount() -> ValueObservation<ValueReducers.Unavailable<Int>>
    { preconditionFailure() }
}

extension TableRecord where Self: FetchableRecord {
    @available(*, unavailable, message: "Use ValueObservation.tracking(MyRecord.fetchAll) instead")
    public static func observationForAll() -> ValueObservation<ValueReducers.Unavailable<[Self]>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(MyRecord.fetchOne) instead")
    public static func observationForFirst() -> ValueObservation<ValueReducers.Unavailable<Self?>>
        { preconditionFailure() }
}

extension ValueObservation {
    @available(*, unavailable, message: "Custom reducers are no longer supported")
    public static func tracking(_ regions: DatabaseRegionConvertible..., reducer: @escaping (Database) throws -> Reducer) -> ValueObservation
    { preconditionFailure() }

    @available(*, unavailable, message: "Custom reducers are no longer supported")
    public static func tracking(_ regions: [DatabaseRegionConvertible], reducer: @escaping (Database) throws -> Reducer) -> ValueObservation
    { preconditionFailure() }
    
    @available(*, unavailable, message: "compactMap is no longer available")
    public func compactMap<T>(_ transform: @escaping (Reducer.Value) -> T?) -> ValueObservation<ValueReducers.Unavailable<T>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use start(in:onError:onChange:) instead.")
    public func start(
        in reader: DatabaseReader,
        onChange: @escaping (Reducer.Value) -> Void) throws -> TransactionObserver
    { preconditionFailure() }
}

extension ValueObservation where Reducer == ValueReducers.Auto {
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingCount<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<Int>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<[Request.RowDecoder]>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<Request.RowDecoder?>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<[Request.RowDecoder.Wrapped?]>>
        where Request.RowDecoder: _OptionalProtocol,
        Request.RowDecoder.Wrapped: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<[Request.RowDecoder]>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request) ->
        ValueObservation<ValueReducers.Unavailable<Request.RowDecoder?>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<[Row]>>
        where Request.RowDecoder == Row
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.Unavailable<Row?>>
        where Request.RowDecoder == Row
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func tracking<Value>(
        _ regions: DatabaseRegionConvertible...,
        fetch: @escaping (Database) throws -> Value)
        -> ValueObservation<ValueReducers.Unavailable<Value>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(_:) instead")
    public static func tracking<Value>(
        _ regions: [DatabaseRegionConvertible],
        fetch: @escaping (Database) throws -> Value)
        -> ValueObservation<ValueReducers.Unavailable<Value>>
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "tracking(_:)")
    public static func tracking<Value>(
        value: @escaping (Database) throws -> Value)
        -> ValueObservation<ValueReducers.Unavailable<Value>>
    { preconditionFailure() }
}

extension ValueObservation where Reducer.Value: Equatable {
    @available(*, unavailable, renamed: "removeDuplicates")
    public func distinctUntilChanged() -> ValueObservation<ValueReducers.Unavailable<Reducer.Value>>
    { preconditionFailure() }
}

extension ValueReducers {
    @available(*, unavailable)
    public enum Unavailable<T>: _ValueReducer {
        public var isObservedRegionDeterministic: Bool
        { preconditionFailure() }
        
        public func fetch(_ db: Database) throws -> Never
        { preconditionFailure() }
        
        public mutating func value(_ fetched: Never) -> T?
        { preconditionFailure() }
    }
}

@available(*, unavailable, message: "Custom reducers are no longer supported")
typealias ValueReducer = _ValueReducer

@available(*, unavailable, renamed: "ValueObservationScheduling")
typealias ValueScheduling = ValueObservationScheduling

#if SQLITE_HAS_CODEC
extension Configuration {
    @available(*, unavailable, message: "Use Database.usePassphrase(_:) in Configuration.prepareDatabase instead.")
    public var passphrase: String? {
        get { preconditionFailure() }
        set { preconditionFailure() }
    }
}

extension DatabasePool {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}

extension DatabaseQueue {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}
#endif