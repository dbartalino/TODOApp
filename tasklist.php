<?php

require_once 'todolist_connectDB.php';

class DisplayQuery {

	function queryDisplay($dbConnect) {

		$taskQuery = $dbConnect->prepare("
			SELECT a.staskname, d.ntaskid, d.btaskdeleted, u.susername
			FROM addtask a
			LEFT JOIN deletetask d ON a.ntaskid = d.ntaskid
			LEFT JOIN users u ON a.nuserid = u.nuserid
			WHERE a.nuserid = :nuserid
			AND d.btaskdeleted = 0
		");

		$taskQuery->execute([
			'nuserid' => $_SESSION['NUSERID']
		]);

		// If addtask table has no rows set taskQuery to empty to output "No tasks" message
		$taskQuery = $taskQuery->rowCount() ? $taskQuery : [];

		return $taskQuery;
	}
}
?>

<?php
$taskQuery = new DisplayQuery();
$taskQuery = $taskQuery->queryDisplay($dbConnect);
?>

<!DOCTYPE html>
<html>
	<head>
		<title>To Do List</title>
		<link rel="stylesheet" type="text/css" href="stylesheet.css">
	</head>
	<body>
		<h1 id="pageFont">To Do List</h1>

		<!-- Create text box and submit button to add tasks -->
		<form method="post" action="addtask.php">
			<input id="pageFont" type="text" name="staskname" placeholder="Enter a task" required>
			<input class="addBox" type="submit" value="Add task">
		</form>
		<br/>

		<!--	Display tasks and checkbox to delete tasks in table
					Else display "No tasks" message -->
		<?php if(!empty($taskQuery)): ?>
			<table id="pageFont">
				<tr>
					<th>Delete</th>
					<th>Task Name</th>
				<tr/>
				<?php foreach($taskQuery as $taskQ): ?>
					<tr>
						<td><a href="deletetask.php?ntaskid=<?php echo $taskQ['ntaskid']; ?>" class="deleteBox"></a></td>
						<td><?php echo $taskQ['staskname']; ?></td>
					</tr>
				<?php endforeach; ?>
			<?php else: ?>
				<p id="pageFont">No tasks have been entered.</p>
			<?php endif; ?>
	</body>
</html>
