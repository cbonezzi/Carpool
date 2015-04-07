///
/// The different types of environments that are supported.
///
/// kGWAEnvironmentSandbox for pre-production testing
/// kGWAEnvironmentStrictSandbox for pre-production testing after being white listed.
/// kGWAEnvironmentProduction for the real production system.
///
typedef NS_ENUM(int, GWAEnvironment) {
  ///
  /// Environment constant for running in sandbox with relaxed application / merchant requirements.
  ///
  kGWAEnvironmentSandbox,
  ///
  /// Environment constant for running in sandbox with more stringent application / merchant
  /// requirements.
  ///
  kGWAEnvironmentStrictSandbox,
  ///
  /// Environment constant for running in production with the most stringent application / merchant
  /// requirements.
  ///
  kGWAEnvironmentProduction
};
