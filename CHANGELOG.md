# v0.1.2
- **Breaking Change**: Renamed `authors` to `author` (singular)
- **Breaking Change**: Author is now a single dictionary with `name` (required), `netid` (optional), and `uin` (optional)
- **Breaking Change**: Author fields are now displayed directly (Name, NetID, UIN) without "Author:" label
- Added `partners` field (nullable, defaults to `none`) for partner assignments
- When `partners` is specified, `author` must be provided
- Updated documentation with examples of new structure

# v0.1.0+1
- Section indices can now be disabled.

# v0.1.0
- First version.