# v0.1.2
- **Breaking Change**: Authors now support structured data with `name` (required), `netid` (optional), and `uin` (optional) fields
- Added `partners` field (nullable, defaults to `none`) for partner assignments
- Added validation: when `partners` is specified, `authors` must be exactly one
- Backwards compatible: authors still support simple string format
- Updated documentation with examples of new features

# v0.1.0+1
- Section indices can now be disabled.

# v0.1.0
- First version.