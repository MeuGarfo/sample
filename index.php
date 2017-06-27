<?php
if(file_exists('offline')){
    die('maintenance mode');
}
define("ROOT",__DIR__."/");
require_once 'inc/inc.php';
inc([
    'controller',
    'crud',
    'isDev',
    'view'
]);
if(!isDev()){
    error_reporting(0);
}
require_once __DIR__ . '/vendor/autoload.php';
$klein = new \Klein\Klein();

$klein->onHttpError(function () {
    view('404');
});

$klein->respond('GET', '/', function ($request, $response, $service) {
    require 'view/index.php';
});

$klein->dispatch();
