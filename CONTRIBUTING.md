## Guidelines for Updating the CHANGELOG

- Update the `CHANGELOG.md` file with every pull request that introduces a change.
- Follow the Keep a Changelog format with sections: **Unreleased, Added, Changed, Deprecated, Removed, Fixed, and Security.**
- Include the date in the format **`YYYY-MM-DD`**.
- Provide a brief **description** of the change.
- Reference any related issue or pull request numbers.

## Example Entry

## [1.2.0] - 2025-03-21
### Added
- Introduced password reset functionality via email verification. (#45)

### Changed
- Improved UI for the user profile page for better mobile responsiveness. (#47)

### Deprecated
- Deprecated support for Node.js v12. Future releases will require v16 or higher. (#52)

### Removed
- Removed the old `/getUserInfo` endpoint, replaced by `/fetchUserProfile`. (#54)

### Fixed
- Fixed an issue where the login button was unresponsive on Safari browsers. (#50) 

### Security
- Patched a JWT token validation vulnerability to prevent token forgery attacks. (#56)



