<?php

require_once 'todolist_connectDB.php';

class DeleteTask {

	function taskDelete($dbConnect) {

		if(isset($_GET['ntaskid'])) {
			$taskid = $_GET['ntaskid'];

			$deleteQuery = $dbConnect->prepare("
					UPDATE deletetask d
					INNER JOIN addtask a on d.ntaskid	= a.ntaskid
					SET btaskdeleted = 1, dtchangedon = NOW()
					WHERE d.ntaskid = :ntaskid
					AND a.nuserid = :nuserid
				");

				$deleteQuery->execute([
					'ntaskid' => $taskid,
					'nuserid' => $_SESSION['NUSERID']
				]);
		}
	}
}

$delete = new DeleteTask();
$delete = $delete->taskDelete($dbConnect);

header('Location: tasklist.php');
?>
