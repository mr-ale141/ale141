<?PHP

namespace Tiny\Eating;

class Fruit {
  public static function munch($bite) {
    print "Here is a tiny munch of $bite.</br>";
  }
}

\Tiny\Eating\Fruit::munch("banana");

print "</br>";

Fruit::munch("banana");         // обращение к текущему пространству имен (см. строку 3)

print "</br>";

namespace Tiny;                 // меняем прострнство имен

use Tiny\Eating\Fruit as Snack; // делаем псевдоним Snack

Snack::munch("strawberry");

use Tiny\Eating\Fruit;          // делаем "псевдоним" Fruit

Fruit::munch("banana");

?>