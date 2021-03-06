# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased][]

## [0.5.0][] - 2018-07-31
### Added
-   Payee API function: get_payee_invoices_changed_since_timestamp
-   Payer API function: get_payee_invoices_list_details

### Changed
-   Many function return values were changed:
    -    Error maps are structs now. e.g. `%{error_code: "...", error_message: "..."}` is now `%Tipalti.ClientError{error_code: "...", error_message: "..."}`
    -    A new `Tipalti.RequestError` struct will be returned for HTTP request errors
    -    `Payee.get_extended_payee_details_list/1` now returns `{:ok, [Tipalti.PayeeExtended.t()]}`
    -    `Payee.get_payee_details/1` now returns `{:ok, Tipalti.Payee.t()}`
    -    `Payee.payee_payable/2` now returns `{:ok, true}` or `{:ok, false, reason}`
    -    `Payee.payee_payment_method/1` now returns `{:ok, String.t()}`
    -    Any function that used to return `{:ok, :ok}` now just returns `:ok`
    -    `Payer.create_or_update_invoices` now returns the list of responses directly instead of wrapped in a map
    -    refer to the documentation for any additional details

## [0.4.0][] - 2018-05-05
### Added
-   Support passing in preferredPayerEntity parameter in setup iframe

## [0.3.0][] - 2018-06-12
### Updated
-   Updated several dependencies, including upgrading to tesla 1.0

## [0.2.0][] - 2018-05-03
### Added
-   Payer function CreateOrUpdateInvoices ([docs](https://hexdocs.pm/tipalti/Tipalti.API.Payer.html#create_or_update_invoices/0))

## 0.1.0 - 2018-04-26
### Initial release

[Unreleased]: https://github.com/peek-travel/tipalti-elixir/compare/0.5.0...HEAD
[0.5.0]: https://github.com/peek-travel/tipalti-elixir/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/peek-travel/tipalti-elixir/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/peek-travel/tipalti-elixir/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/peek-travel/tipalti-elixir/compare/0.1.0...0.2.0
