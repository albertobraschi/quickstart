#========================
# GLOBAL CONSTANTS
#========================

#site info
#GLOBAL CONSTANTS
SITE_URL = "http://www.mydomain.com/"
SITE_EMAIL_ADDRESS = "admin@mydomain.com"
SITE_NAME = "QuickStart app"
ADMIN_LOGIN = "admin"
ADMIN_PASSWORD = "admin"
ADMIN_EMAIL_ADDRESS = "admin@mydomain.com"

#DB Validation Constants
DB_STRING_MAX_LENGTH=255 
DB_TEXT_MAX_LENGTH=40000

#REGEX
EMAIL_REGEX = /\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z/i
DECIMAL_REGEX   = /\A\d+((\.\d{2})|(\.\d{1}))?\Z/ #decimal with scale 2
MYSQL_DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\Z/

#========================
# WILL PAGINATE
#========================
WillPaginate::ViewHelpers.pagination_options[:prev_label] = I18n.t("pagination.previous")
WillPaginate::ViewHelpers.pagination_options[:next_label] = I18n.t("pagination.next")

#========================
# OTHER SETTINGS
#========================

# change way how rails show validation errors on fields
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| "<span class='field_with_errors'>#{html_tag}</span>" end