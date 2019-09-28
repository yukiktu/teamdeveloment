
Admin.create!(
  [
    {
      email:"yuuki0421ktu@gmail.com",
      password: "kattakatao",
    },
    {
      email:"xxx@xxx",
      password:"xxxxxx",
    },
    {
      email:"yyy@yyy",
      password: "yyyyyy",
    },
    {
      email: "zzz@zzz",
      password: "zzzzzz",
    }
  ]
)
EndUser.create!([
  {
  email: "teru@teru.com",
  password: "teruteruteru",
  last_name:"テル",
  first_name: "テル",
  kana_last_name: "テル",
  kana_first_name: "テル",
  postal_code: "000-0000",
  address: "渋谷区",
  phone_number: "00-0000-0000",
  }
])
TaxRate.create!(
  [
    {
      tax_rate: "1.08"
    }
  ]
  )
ShippingFee.create!(
  [
    {
      shipping_fee: "500"
    }
  ]
  )