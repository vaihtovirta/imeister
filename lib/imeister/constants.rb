module Imeister
  WARRANTY_URL = 'https://selfsolve.apple.com'
  RESULTS_URL = '/wcResults.do'
  STATUS_REGEXP = /(?:warrantyPage\.warrantycheck\.displayHWSupportInfo\()((?:\w)+)/i
  EXPIRATION_DATE_REGEXP = /(?:Estimated\ Expiration\ Date:\ )((?:[^<]*))/i
  VALID_IMEI_REGEXP = /^\d{15}*$/
end
