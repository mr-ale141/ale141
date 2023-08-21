<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Table</title>
</head>
<body>
  <p>Table:</p>
  <table>
    <?php 
      echo "<th>No.</th>";
      $keys = array_keys($table[0]);
      foreach ($keys as $title) echo "<th>$title</th>";
      $count = 1;
      foreach ($table as $row): 
    ?>
      <tr>
        <td><?php echo $count; ?></td>
        <?php foreach ($row as $item): ?>
          <td>
            <?php 
              echo htmlspecialchars($item, ENT_QUOTES, 'UTF-8'); 
            ?>
          </td>
        <?php endforeach; $count++; ?>
      </tr>
    <?php endforeach; ?>
  </table>
</body>
</html>