class ApplicationController < ActionController::Base
  CATEGORY_GUID_AUTO = ::Md::DefaultCategories.category_from_mdx_name("Auto & Transport").guid
  CATEGORY_GUID_BILLS_AND_UTILITIES = ::Md::DefaultCategories.category_from_mdx_name("Bills & Utilities").guid
  CATEGORY_GUID_ENTERTAINMENT = ::Md::DefaultCategories.category_from_mdx_name("Entertainment").guid
  CATEGORY_GUID_FOOD = ::Md::DefaultCategories.category_from_mdx_name("Food & Dining").guid
  CATEGORY_GUID_HEALTH = ::Md::DefaultCategories.category_from_mdx_name("Health & Fitness").guid
  CATEGORY_GUID_HOME = ::Md::DefaultCategories.category_from_mdx_name("Home").guid
  CATEGORY_GUID_INCOME = ::Md::DefaultCategories.category_from_mdx_name("Income").guid
  CATEGORY_GUID_INTERNET = ::Md::DefaultCategories.category_from_mdx_name("Internet").guid
  CATEGORY_GUID_INVESTMENTS = ::Md::DefaultCategories.category_from_mdx_name("Investments").guid
  CATEGORY_GUID_MOBILE_PHONE = ::Md::DefaultCategories.category_from_mdx_name("Mobile Phone").guid
  CATEGORY_GUID_PAYCHECK = ::Md::DefaultCategories.category_from_mdx_name("Paycheck").guid
  CATEGORY_GUID_SHOPPING = ::Md::DefaultCategories.category_from_mdx_name("Shopping").guid
  CATEGORY_GUID_TAXES = ::Md::DefaultCategories.category_from_mdx_name("Taxes").guid
  CATEGORY_GUID_TRANSFER = ::Md::DefaultCategories.category_from_mdx_name("Transfer").guid
  CATEGORY_GUID_UNCATEGORIZED = ::Md::DefaultCategories.category_from_mdx_name("Uncategorized").guid
  CATEGORY_GUID_UTILITIES = ::Md::DefaultCategories.category_from_mdx_name("Utilities").guid

      # :nocov:
      BILL_CATEGORY_GUIDS = [
        CATEGORY_GUID_BILLS_AND_UTILITIES,
        CATEGORY_GUID_INTERNET,
        CATEGORY_GUID_MOBILE_PHONE,
        CATEGORY_GUID_UTILITIES,
      ].freeze
  
      # NOTE: This must be kept in sync with https://gitlab.mx.com/mx/pulse/-/blob/master/src/constants/Category.js#L170
      NON_SPENDING_CATEGORY_GUIDS = [
        CATEGORY_GUID_INCOME,
        CATEGORY_GUID_INVESTMENTS,
        CATEGORY_GUID_TRANSFER,
        CATEGORY_GUID_UNCATEGORIZED,
        CATEGORY_GUID_TAXES,
      ].freeze
      # :nocov:
  
      DEFAULT_PARENT_CATEGORY_GUIDS = ::Md::DefaultCategories.default_parent_categories.map(&:guid)
  
      SPENDING_CATEGORY_GUIDS = DEFAULT_PARENT_CATEGORY_GUIDS - NON_SPENDING_CATEGORY_GUIDS

      print NON_SPENDING_CATEGORY_GUIDS

      def self.digest_for_beat(*parts)
        ::Digest::MD5.base64digest(parts.join + self.class.template)
        puts parts
      end

      # testing = ApplicationController.digest_for_beat("1", "hello")
      module BeatFactory
        class Base

          def self.template
            name.demodulize
          end

        end
      end

      puts ApplicationController::BeatFactory::Base.template
    

      
  


end
