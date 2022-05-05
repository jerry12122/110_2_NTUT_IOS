import UIKit

enum Day{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
func dayType(for day:Day)->String
{
    switch day{
    case .Monday: return "Weekday"
    case .Tuesday: return "Weekday"
    case .Wednesday: return "Weekday"
    case .Thursday: return "Weekday"
    case .Friday: return "Weekday"
    case .Saturday: return "Weekend"
    case .Sunday: return "Weekend"
    }
}
var day = Day.Monday
print(dayType(for: day))
day = Day.Tuesday
print(dayType(for: day))
day = Day.Wednesday
print(dayType(for: day))
day = Day.Thursday
print(dayType(for: day))
day = Day.Friday
print(dayType(for: day))
day = Day.Saturday
print(dayType(for: day))
day = Day.Sunday
print(dayType(for: day))

