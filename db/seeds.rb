User.create!(
    name: '山本　昇平',
    kana: 'ヤマモト　ショウヘイ',
    email: 'provisioninc@outlook.jp',
    subject: '英語',
    password: 'pass',
    password_confirmation: 'pass',
    admin: true
)

User.create!(
    name: '川畑　歩美',
    kana: 'カワバタ　アユミ',
    email: 'ecckawabata@outlook.jp',
    subject: '英語 国語 数学',
    password: 'pass',
    password_confirmation: 'pass',
    admin: true
)

User.create!(
    name: 'ピチクール　仁香',
    kana: 'ピチクール　ニカ',
    email: 'eccnika@outlook.jp',
    subject: '英語',
    password: 'pass',
    password_confirmation: 'pass',
    admin: false
)

Student.create!(
    name: '柳内  悠惺',
    kana: 'ヤナイ　ユウセイ',
    email: 'yanai@email.com',
    birthdate: '20070613',
    school: '平三中',
    memo: ''
)

Student.create!(
    name: '大野 心路',
    kana: 'オオノ ココロ',
    email: 'shoheiyamamoto@hotmail.com',
    birthdate: '20090401',
    school: '平三中',
    memo: ''
)


