<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/models/Student.php';

try {
    $db = Database::connect();
    $studentModel = new Student($db);
} catch (Exception $e) {
    die('<h1 style="color:red;">Database connection failed</h1>');
}

$login_message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['student_id'])) {
    $id = trim($_POST['student_id']);
    $password = $_POST['password'] ?? '';
    $privacy_agree = isset($_POST['privacy_agree']);

    if (!$privacy_agree) {
        $login_message = 'You must agree to the Data Privacy Policy to sign in.';
    } else {
        $student_info = $studentModel->authenticate($id, $password);

        if ($student_info) {
            $_SESSION['student']       = $student_info;
            $_SESSION['summary']       = $studentModel->getSummary($id) ?? [];
            $_SESSION['grades']        = $studentModel->getGrades($id) ?? [];
            $_SESSION['announcements'] = $studentModel->getAllAnnouncements() ?? [];

            header("Location: index.php?page=dashboard&login=success");
            exit;
        } else {
            $login_message = 'Invalid Student ID or Password.';
        }
    }
}

if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
    header("Location: index.php");
    exit;
}

if (isset($_GET['action']) && $_GET['action'] === 'change_password') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_SESSION['student']['student_id'])) {

        $student_id = $_SESSION['student']['student_id'];
        $current = $_POST['current_password'] ?? '';
        $new = $_POST['new_password'] ?? '';
        $confirm = $_POST['confirm_password'] ?? '';

        if ($new !== $confirm) {
            var_dump('PASSWORDS_DO_NOT_MATCH');
            exit;
        }

        $ok = $studentModel->changePassword($student_id, $current, $new);
        var_dump($ok);
        exit;
    }
}


if (!isset($_SESSION['student'])) {
    include __DIR__ . '/views/student/login.php';
    exit;
}

$page = $_GET['page'] ?? 'dashboard';

$allowed_pages = [
    'dashboard',
    'profile',
    'schedule',
    'grades',
    'billing',
    'regform',
    'checklist',
    'announcements',
    'change_password'
];

if (!in_array($page, $allowed_pages, true)) {
    $page = 'dashboard';
}

$page_title = ucfirst($page) . " | CvSU Student Portal";

require_once __DIR__ . '/models/AnnouncementModel.php';
$announcementModel = new AnnouncementModel($db);

if (method_exists($announcementModel, 'getLatestAnnouncements')) {
    $_SESSION['latest_announcements'] = $announcementModel->getLatestAnnouncements(5);
} else {
    $stmt = $db->prepare("
        SELECT * 
        FROM announcements 
        WHERE status = 'active' 
        ORDER BY created_at DESC 
        LIMIT 5
    ");
    $stmt->execute();
    $_SESSION['latest_announcements'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

include __DIR__ . '/views/student/includes/header.php';

echo '<main class="min-h-screen transition-all duration-300 pt-2 sm:pt-5">';

$page_file = __DIR__ . "/views/student/{$page}.php";
if (file_exists($page_file)) {
    include $page_file;
} else {
    echo '<div class="p-6 bg-white rounded shadow">Page not found.</div>';
}

echo '</main>';

include __DIR__ . '/views/student/includes/footer.php';