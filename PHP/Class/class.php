<?PHP
class Entree {
  /*
    private - закрытый (виден только внутри класса)
    protected - защищенный (виден только внутри класса и подкласса)
    public - открытый
  */
  private $name;
  protected $ingredients = array();
  
  // т.к. $name закрыт для чтения вне класса создаем метод
  public function getName() {
    return $this->name;
  }

  public function __construct($name, $ingredients) {
    if (! is_array($ingredients)){
      throw new Exception('$ingredients must be an array'); //Генерирование исключения
    }
    $this->name = $name;
    $this->ingredients = $ingredients;
  }
  
  public function hasIngredient($ingredient) {
    return in_array($ingredient, $this->ingredients);
  }

  public static function getSizes() {
    return array('small', 'medium', 'large');
  }
}

class ComboMeal extends Entree {
  public function __construct($name, $entrees) {
    parent::__construct($name, $entrees);
    foreach ($entrees as $entree) {
      if (! $entree instanceof Entree) {
        throw new Exception('Elements of $entrees must be Entree objects');
      }
    }
  }

  public function hasIngredient($ingredient) {
    foreach ($this->ingredients as $entree) {
      if ($entree->hasIngredient($ingredient)) {
        return true;
      }
    }
    return false;
  }
}

$soup = new Entree('Chicken Soup', array('chiken', 'water'));
$sandwich = new Entree('Chicken sandwich', array('chiken', 'bread'));
$combo = new ComboMeal('Soup + Sandwich', array($soup, $sandwich));

$sizes = Entree::getSizes();
print '| ' . implode(' | ', $sizes) . ' |' . "</br>";

print "</br>";

foreach (['chiken', 'lemon', 'bread', 'water'] as $ing) {
  if ($soup->hasIngredient($ing)) {
    print "Soup contains $ing.</br>";
  }
  if ($sandwich->hasIngredient($ing)) {
    print "Sandwich contains $ing.</br>";
  }
}

print "</br>";

foreach (['chiken', 'water', 'pickles'] as $ing) {
  if ($combo->hasIngredient($ing)) {
    print "Something in the combo contains $ing.</br>";
  }
}

print "</br>";

try {                                                               // пробуем создать класс
  $drink = new Entree('Glass of milk', 'milk');
  if ($drink->hasIngredient('milk')) {
    print "Yummy!";
  }
} catch (Exception $e) {
  print "Couldn't create the drink: " . $e->getMessage() . "</br>"; // обработка исключения
}

?>