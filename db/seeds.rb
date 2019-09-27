
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

Genre.create!([
  {
  genre_name:"ゲーム音楽"
},
{
  genre_name:"J-POP"
},
{
  genre_name:"ロック"
}
])

Artist.create!([
  {
  artist_name:"FreQuency"
},
{
  artist_name:"Mrs.GREEN APPLE"
},
{
  artist_name:"米津玄師"
},
{
  artist_name:"GLAY"
},
{
  artist_name:"寺尾聰"
},
{
  artist_name:"嵐"
},
{
  artist_name:"back number"
}
])


Label.create!([
  {
  label_name:"FROMSOUNDRECORDS"
},
{
  label_name:"Universal Music =music="
},
{
  label_name:"SMR"
},
{
  label_name:"ポニーキャニオン"
},
{
  label_name:"SME"
},
{
  label_name:"EMIミュージック・ジャパン"
},
{
  label_name:"ジェイ・ストーム"
},
])

# Item.create!([
#   {
#     item_name:"FreQuency",
#     list_price:"62047",
#     cost_price:"2068",
#   },
#   {
#     item_name:"Attitude(初回限定盤)",
#     list_price:"1850",
#     cost_price:"617",
#   },
#   {
#     item_name:"Lemon(初回限定)",
#     list_price:"1482",
#     cost_price:"494",
#   },
#   {
#     item_name:"NO DEMOCRACY",
#     list_price:"4104",
#     cost_price:"1368",
#   },
#   {
#     item_name:"馬と鹿 (通常盤)",
#     list_price:"1000",
#     cost_price:"333",
#   },
#   {
#     item_name:"How It Feels To Be Lost",
#     list_price:"1431",
#     cost_price:"477",
#   },
#   {
#     item_name:"TWIN BEST",
#     list_price:"2370",
#     cost_price:"857",
#   },
#   {
#     item_name:"5×20 All the BEST!! 1999-2019",
#     list_price:"5546",
#     cost_price:"1849",
#   },
#   {
#     item_name:"MAGIC(通常盤)",
#     list_price:"2755",
#     cost_price:"918",
#   }
# ])
