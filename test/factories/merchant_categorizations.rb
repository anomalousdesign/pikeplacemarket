# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :merchant_categorization, :class => 'MerchantCategorizations' do
    merchant_id 1
    merchant_category_id 1
  end
end
