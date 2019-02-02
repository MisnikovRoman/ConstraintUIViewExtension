# ConstraintUIViewExtension
Удобные функции для создания констрейнтов

1. Прикрепить к внешним границам вида
```swift
blueView.snap(inside: redView, with insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```

2. Прикрепить к одной стороне вида изнутри
```swift
blueView.snap(inside: redView, from: .top, at: 20)
```

3. Прикрепить снаружи 
```swift
blueView.snap(to: redView, from: .top, at: 20)
```

4. Установить размеры
```swift
blueView
  .setSize(height: 20)
  .setSize(width: 10)
  .setSize(height: 50, width: 100)
```

5. Установить соответствие размеров между видами
```swift
blueView
  .setEqual(.height, to: redView)
  .setEqual(.width, to: redView)
```

6. Соответствие центральных осей
```swift
blueView
  .center(.x, to: redView)
```
