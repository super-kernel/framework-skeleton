<?php
declare(strict_types=1);
ini_set('display_errors', 'on');
ini_set('display_startup_errors', 'on');
ini_set('memory_limit', '1G');

error_reporting(E_ALL);

use SuperKernel\Contract\ApplicationInterface;
use SuperKernel\Di\Factory\ContainerFactory;

require_once __DIR__ . '/../vendor/autoload.php';

$container = new class extends ContainerFactory {
}();

$container->get(ApplicationInterface::class)->run();