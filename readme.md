# Movie Example
一個完整Microservices範例

## Use Case
![useCase](out/diagram/useCase/useCase@1-9.png)
## Scenario
```gherkin
Feature: User Registraion
    Scenario Outline: User Registraion
        Given I am a unregister user
            And I provide a <name>
            And I provide a <phone>
        When I register the account
        Then I got my user id
            And I can check my name is <name>
            And I can check my phone number is <phone>

        Examples:
            | name  | phone       |
            | Ben   | 1234567890  |
            | Marry | 1234523590  |
```
```gherkin
Feature: Movie Detail
    Background:
        Given the following movies exist:
            | name        |
            | La La Land  |
            | Moonlight   |
            | Zootopia    |

    Scenario: View All Movie Detail
        Given I am a guest
        When I view all movies detail
        Then I get 3 movies detail

    Scenario Outline: View a Specific Movie Detail
        Given I am a guest
            And I provide a <movieName>
        When I view a specific movies detail
        Then The movie name should be exist

        Examples:
            | movieName   |
            | La La Land  |
            | Moonlight   |
            | Zootopia    |
```
```gherkin
Feature: Movie Timetable

    Background:
        Given the following show exist:
            | startTime  | theater | emptySeat | movie       |
            | 10:00      | 2       | 21        | La La Land  |
            | 10:10      | 3       | 12        | La La Land  |
            | 10:20      | 1       | 2         | Moonlight   |
            | 13:00      | 4       | 0         | Zootopia    |

    Scenario: View Movie Timetable
        Given I am a guest
        When I view timetable
        Then I get 4 show information

    Scenario Outline: View Show Detail
        Given I am a guest
            And I provide a <movie>
        When I view show detail
        Then The number of result should be <resultNumber>
            And <emptySeat> empty seat should be exist in one item
        
        Examples:
            | movie      | resultNumber | emptySeat   |
            | La La Land | 2            | 21          |
            | La La Land | 2            | 12          |
            | Moonlight  | 1            | 2           |
            | Zootopia   | 1            | 0           |
```
```gherkin
Feature: Ticket

    Scenario: Book tickets
        Given the following the user exist:
            | name  | phone       |
            | Ben   | 1234567890  |
            And the show exist:
                | startTime  | theater | emptySeat | movie       |
                | 10:00      | 2       | 21        | La La Land  |
        When The user book a La La Land ticket
        Then Successful book the ticket

    Scenario: Pick up tickets
        Given Ben is a user
            And Ben has a order which is not picked up
        When The Ben pick the ticket
        Then Successful pick up the ticket
```
## Sequence Diagram
![Registration](out/diagram/registration/Registration.png)

![viewMovieDetail](out/diagram/viewMovieDetail/View%20Movie%20Detail.png)

![viewTimetable](out/diagram/viewTimetable/View%20Movie%20Timetable.png)

![bookMovieTickets](out/diagram/bookMovieTickets/Book%20Movie%20Tickets.png)

![getMovieTickets](out/diagram/pickUpMovieTickets/Pick%20Up%20Movie%20Tickets.png)

## Services

總共有4個微服務，分別為User、Movie、Theater、Order。

### User
- POST /user/registration 使用者註冊
- GET /user/{id} 抓取使用者資訊

#### User Table
```java
public class User{
    UUID id;
    String name;
    String phone;
}
```

### Movie
- GET /movies 取得電影資訊
- GET /movie/{id} 取得該電影資訊
- GET /movie?q={name} 取得該電影資訊

#### Movie Table
```java
public class Movie{
    UUID id;
    String title;
    int year;
    String rated;
    int runTime;
    String genre;
    String director;
    String actors;
    String plot;
}
```

### Theater
- GET /theater/timetable 電影時刻表
- GET /theater/{theatherId} 電影廳資訊
- GET /theater/show/{showId} 電影廳該場次資訊

#### Theater Table
```java
public class Theater{
    int id;
    int capacity;
}
```
#### Show Table
```java
public class Show{
    UUID id;
    int theaterId;
    UUID movieId;
    long start;
    long end;
    int emptySeat;
}
```

### Order
- POST /book 訂票
- GET /tickets/?userId={userId} 查看訂票
- POST /tickets/{orderId} 取票

#### Order Table
```java
public class Order{
    UUID id;
    UUID userId;
    UUID showId;
    long timestamp;
    boolean isPickUp;
}
```