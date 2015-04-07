///
/// The role of the line item.
///
typedef NS_ENUM(NSInteger, GWALineItemRole) {
  kGWALineItemRoleRegular,   // A regular cart item.
  kGWALineItemRoleShipping,  // A line item representing shipping costs.
  kGWALineItemRoleTax,       // A line item representing taxes.
};
