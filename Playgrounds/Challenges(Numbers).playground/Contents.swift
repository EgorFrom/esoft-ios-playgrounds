/*
 1. Recreate the pow() function

 Напишите функцию возведения в степень, которая принимает два положительных Int.

 Hint #1: Можно использовать guard или precondition(), чтобы убедиться, что оба числа положительные.
 */

func challenge1(number: Int, power: Int) -> Int {
  if power < 0 { return 0 }
  return Array(repeating: number, count: power).reduce(1, {$0 * $1})
}

assert(challenge1(number: 4, power: 3) == 64, "Challenge 1 failed")
assert(challenge1(number: 2, power: 8) == 256, "Challenge 1 failed")

/*
 2. Binary reverse

 Напишите функцию, которая принимает unsigned 8-bit Int (UInt) и возвращает отраженное бинарное число,
 дополненное таким образом, чтобы было ровно 8 цифр.

 Tip: когда вы пытаетесь получить бинарное представление числа,
 Swift всегда будет использовать минимально возможное количество бит.
 Поэтому убедитесь, что вы дополнили число до 8 символов перед отражением.

 Hint #1: Можно попробовать использовать бинарное представление используя String(someNumber, radix: 2)
 Hint #2: Десятичное представление бинарной строки - Int(someString, radix: 2), не забудьте, что результат будет Optional
 Hint #3: Чтобы дополнить бинарное представление до 8 цифр, используйте String(repeating:count:)
 */
func doublePresenter(number: UInt) -> String {
  let binaryPresentedNumber: String = String(number, radix: 2)
  let countAddingZero: Int = 8 - binaryPresentedNumber.count % 8
  return String(repeating: "0", count: countAddingZero) + binaryPresentedNumber
}

func challenge2(number: UInt) -> UInt {
  let reverseResponse: String = String(doublePresenter(number: number).reversed())
  guard let response: UInt = UInt(reverseResponse, radix: 2) else { return UInt.min }
  return response
}

// 32 это 100000 в бинарном представлении, дополним до 8 - 00100000. Отраженная последовательность - 00000100, что представляет собой - 4
assert(challenge2(number: 32) == 4, "Challenge 2 failed")

// 41 это 101001 в бинарном представлении, дополним до 8 - 00101001. Отраженная последовательность - 10010100, что представляет собой - 148
assert(challenge2(number: 41) == 148, "Challenge 2 failed")

// метод должен быть симметричный, т.е. переданое число 4 должно равняться 32 (см. первый assert)
assert(challenge2(number: 4) == 32, "Challenge 2 failed")

/*
 3. Subtract without subtract

 Напишите функцию, которая вычитает один положительный Int из другого, без использования -.

 Hint #1: Можно использовать любой оператор или любое другое число, положительное или отрицательное, но только не оператор -
 Hint #2: Swift содержит полный набор битовых операций, для манипуляции двоичным представлением числа
 Hint #3: Можно попробовать битовое NOT, выглядит так - ~
 */

func challenge3(subtract: Int, from: Int) -> Int {
  return subtract.distance(to: from)
}

assert(challenge3(subtract: 5, from: 9) == 4, "Challenge 3 failed")
assert(challenge3(subtract: 10, from: 30) == 20, "Challenge 3 failed")

