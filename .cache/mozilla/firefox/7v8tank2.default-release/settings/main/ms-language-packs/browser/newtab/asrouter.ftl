# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## These messages are used as headings in the recommendation doorhanger

cfr-doorhanger-extension-heading = Рекомендоване розширення
cfr-doorhanger-feature-heading = Рекомендована функція

##

cfr-doorhanger-extension-sumo-link =
    .tooltiptext = Чому я це бачу?
cfr-doorhanger-extension-cancel-button = Не зараз
    .accesskey = е
cfr-doorhanger-extension-ok-button = Додати
    .accesskey = т
cfr-doorhanger-extension-manage-settings-button = Керувати налаштуваннями рекомендацій
    .accesskey = К
cfr-doorhanger-extension-never-show-recommendation = Не показувати цю рекомендацію
    .accesskey = Н
cfr-doorhanger-extension-learn-more-link = Докладніше
# This string is used on a new line below the add-on name
# Variables:
#   $name (String) - Add-on author name
cfr-doorhanger-extension-author = від { $name }
# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
cfr-doorhanger-extension-notification = Рекомендація
cfr-doorhanger-extension-notification2 = Рекомендація
    .tooltiptext = Рекомендація розширень
    .a11y-announcement = Доступна рекомендація розширень
# This is a notification displayed in the address bar.
# When clicked it opens a panel with a message for the user.
cfr-doorhanger-feature-notification = Рекомендація
    .tooltiptext = Рекомендація функцій
    .a11y-announcement = Доступна рекомендація функцій

## Add-on statistics
## These strings are used to display the total number of
## users and rating for an add-on. They are shown next to each other.

# Variables:
#   $total (Number) - The rating of the add-on from 1 to 5
cfr-doorhanger-extension-rating =
    .tooltiptext =
        { $total ->
            [one] { $total } зірка
            [few] { $total } зірки
           *[many] { $total } зірок
        }
# Variables:
#   $total (Number) - The total number of users using the add-on
cfr-doorhanger-extension-total-users =
    { $total ->
        [one] { $total } користувач
        [few] { $total } користувача
       *[many] { $total } користувачів
    }

## Firefox Accounts Message

cfr-doorhanger-bookmark-fxa-header = Синхронізуйте свої закладки всюди.
cfr-doorhanger-bookmark-fxa-body = Гарна знахідка! Тепер синхронізуйте цю закладку зі своїми мобільними пристроями. Почніть роботу з { -fxaccount-brand-name(case: "abl") }.
cfr-doorhanger-bookmark-fxa-link-text = Синхронізувати закладки зараз…
cfr-doorhanger-bookmark-fxa-close-btn-tooltip =
    .aria-label = Кнопка закриття
    .title = Закрити

## Protections panel

cfr-protections-panel-header = Переглядайте без стеження
cfr-protections-panel-body = Зберігайте свої дані при собі. { -brand-short-name } захищає вас від численних найпоширеніших елементів стеження, що переслідують вас в мережі.
cfr-protections-panel-link-text = Докладніше

## What's New toolbar button and panel

# This string is used by screen readers to offer a text based alternative for
# the notification icon
cfr-badge-reader-label-newfeature = Нова функція:
cfr-whatsnew-button =
    .label = Що нового
    .tooltiptext = Що нового
cfr-whatsnew-release-notes-link-text = Ознайомитися з інформацією про випуск

## Enhanced Tracking Protection Milestones

# Variables:
#   $blockedCount (Number) - The total count of blocked trackers. This number will always be greater than 1.
#   $date (Datetime) - The date we began recording the count of blocked trackers
cfr-doorhanger-milestone-heading2 =
    { $blockedCount ->
        [one] { -brand-short-name } заблокував <b>{ $blockedCount }</b> елемент стеження від { DATETIME($date, month: "long", year: "numeric") }!
        [few] { -brand-short-name } заблокував понад <b>{ $blockedCount }</b> елементи стеження від { DATETIME($date, month: "long", year: "numeric") }!
       *[many] { -brand-short-name } заблокував понад <b>{ $blockedCount }</b> елементів стеження від { DATETIME($date, month: "long", year: "numeric") }!
    }
cfr-doorhanger-milestone-ok-button = Дивитись все
    .accesskey = в
cfr-doorhanger-milestone-close-button = Закрити
    .accesskey = З

## DOH Message

cfr-doorhanger-doh-body = Ваша приватність має значення. { -brand-short-name } тепер надійно спрямовує ваші DNS-запити, коли це можливо, до партнерської служби, щоб захистити вас під час перегляду.
cfr-doorhanger-doh-header = Безпечніша, зашифрована перевірка DNS
cfr-doorhanger-doh-primary-button-2 = Гаразд
    .accesskey = Г
cfr-doorhanger-doh-secondary-button = Вимкнути
    .accesskey = В

## Fission Experiment Message

cfr-doorhanger-fission-body-approved = Ваша приватність має значення. { -brand-short-name } тепер ізолює вебсайти один від одного, що ускладнює викрадення зловмисниками паролів, номерів кредитних карток та інших приватних відомостей.
cfr-doorhanger-fission-header = Ізоляція сайту
cfr-doorhanger-fission-primary-button = Гаразд, зрозуміло
    .accesskey = Г
cfr-doorhanger-fission-secondary-button = Докладніше
    .accesskey = л

## Full Video Support CFR message

cfr-doorhanger-video-support-body = Відео на цьому сайті можуть відтворюватися неправильно в цій версії { -brand-short-name }. Для повноцінної підтримки відео, оновіть { -brand-short-name }.
cfr-doorhanger-video-support-header = Оновіть { -brand-short-name } для відтворення відео
cfr-doorhanger-video-support-primary-button = Оновити
    .accesskey = н

## Spotlight modal shared strings

spotlight-learn-more-collapsed = Докладніше
    .title = Розгорніть для перегляду подробиць про функцію
spotlight-learn-more-expanded = Докладніше
    .title = Закрити

## VPN promotion dialog for public Wi-Fi users
##
## If a user is detected to be on a public Wi-Fi network, they are given a
## bit of info about how to improve their privacy and then offered a button
## to the Mozilla VPN page and a link to dismiss the dialog.

# This header text can be explicitly wrapped.
spotlight-public-wifi-vpn-header = Схоже, ви використовуєте загальнодоступний Wi-Fi
spotlight-public-wifi-vpn-body = Щоб приховати своє розташування та діяльність в Інтернеті, розгляньте можливість використання віртуальної приватної мережі (VPN). Вона допоможе захистити вас під час користування загальнодоступним Інтернетом в громадських місцях, наприклад, в аеропортах та кав'ярнях.
spotlight-public-wifi-vpn-primary-button = Зберігайте приватність з { -mozilla-vpn-brand-name }
    .accesskey = п
spotlight-public-wifi-vpn-link = Не зараз
    .accesskey = е

## Total Cookie Protection Rollout

# "Test pilot" is used as a verb. Possible alternatives: "Be the first to try",
# "Join an early experiment". This header text can be explicitly wrapped.
spotlight-total-cookie-protection-header =
    Випробуйте першими наш найпотужніший
    захист приватності за весь час
spotlight-total-cookie-protection-body = Повний захист кук не дає змогу елементам стеження переслідувати вас в мережі за допомогою кук.
# "Early access" for this feature rollout means it's a "feature preview" or
# "soft launch" as not everybody will get it yet.
spotlight-total-cookie-protection-expanded = { -brand-short-name } обгороджує куки, обмежуючи їх використання сайтом, на якому ви перебуваєте, тому елементи стеження не можуть використовувати їх для переслідування. Завдяки ранньому доступу ви допомагаєте оптимізувати цю функцію, щоб ми продовжували створювати кращий Інтернет для кожного.
spotlight-total-cookie-protection-primary-button = Увімкнути повний захист кук
spotlight-total-cookie-protection-secondary-button = Не зараз

## Emotive Continuous Onboarding

spotlight-better-internet-header = Кращий Інтернет починається з вас
spotlight-better-internet-body = Коли ви використовуєте { -brand-short-name }, ви голосуєте за відкритий і доступний інтернет, кращий для всіх.
spotlight-peace-mind-header = Ми прикриваємо вас
spotlight-peace-mind-body = Щомісяця { -brand-short-name } блокує в середньому понад 3000 елементів стеження на користувача. Тому що ніщо, особливо такі проблеми приватності, як елементи стеження, не повинні стояти між вами та хорошим інтернетом.
spotlight-pin-primary-button =
    { PLATFORM() ->
        [macos] Закріпити в Dock
       *[other] Закріпити на панелі завдань
    }
spotlight-pin-secondary-button = Не зараз
