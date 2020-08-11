# 3.3 ビューの利用

include ActionView::Helpers::NumberHelper

## 3.3.1 金額の３桁区切り表示
puts number_to_currency(100000000)
puts number_to_human(100000000)
