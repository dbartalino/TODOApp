<?php

require_once 'todolist_connectDB.php';

class AddTask {

	function addNewTask($dbConnect) {

		if(isset($_POST['staskname'])) {
			$taskname = $_POST['staskname'];

			if(!empty($taskname)) {
				$addtaskQuery = $dbConnect->prepare("
					INSERT INTO addtask (staskname, nuserid)
					VALUES (:staskname, :nuserid)
				");

				$addtaskQuery->execute([
					'staskname' => $taskname,
					'nuserid' => $_SESSION['NUSERID']
				]);

				$deletetaskQuery = $dbConnect->prepare("
					INSERT INTO deletetask (btaskdeleted, dtcreated)
					VALUES (0, NOW())
				");

				$deletetaskQuery->execute();
			}
		}
	}
}

$add = new AddTask();
$add = $add->addNewTask($dbConnect);

header('Location: tasklist.php');
?>
