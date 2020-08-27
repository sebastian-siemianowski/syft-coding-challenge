# encoding : utf-8

MoneyRails.configure do |config|
  # To set the default currency
  config.default_currency = :gbp
  Money.locale_backend = :currency
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP
  Money.infinite_precision = true
end
