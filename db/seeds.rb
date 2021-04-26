User.create!(
    name: '山本　昇平',
    email: 'provisioninc@outlook.jp',
    subject: '英語',
    password: 'pass',
    password_confirmation: 'pass',
    admin: true
)

User.create!(
    name: 'ピチクール　仁香',
    email: 'eccnika@outlook.jp',
    subject: '英語',
    password: 'pass',
    password_confirmation: 'pass',
    admin: false
)

Student.create!(
    name: '柳内  悠惺',
    kana: 'やない　ゆうせい',
    email: 'yanai@email.com',
    birthdate: '2007/06/13',
    school: '平三中',
    memo: ''
)

Student.create!(
    name: '大野 心路',
    kana: 'オオノ ココロ',
    email: 'shoheiyamamoto@hotmail.com',
    birthdate: '2009/04/01',
    school: '平三中',
    memo: ''
)


