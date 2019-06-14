<?php 

    session_start();

    spl_autoload_register(function ($className) {
        if (substr($className, 0, 4) !== 'ppa\\') { return; }

        $fileName = __DIR__.'/'.str_replace('\\', DIRECTORY_SEPARATOR, substr($className, 4)).'.php';

        if (file_exists($fileName)) { include $fileName; }
    });    
   
    $controllerName = "";
    $doMethodName = "";
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $controllerName = isset($_POST['controller']) && $_POST['controller'] ? $_POST['controller'] : "Welcome";
        $doMethodName = isset($_POST['do']) && $_POST['do'] ? $_POST['do'] : "showWelcome";
    } else {
        $controllerName = isset($_GET['controller']) && $_GET['controller'] ? $_GET['controller'] : "Welcome";
        $doMethodName = isset($_GET['do']) && $_GET['do'] ? $_GET['do'] : "showWelcome";
    }
    
    $controllerClassName = 'ppa\\Controller\\'.ucfirst($controllerName). 'Controller';
    
    if (method_exists($controllerClassName, $doMethodName)) {
        $view = new \ppa\Library\View(__DIR__.DIRECTORY_SEPARATOR.'Views'
                    , ucfirst($controllerName), $doMethodName);

        $controller = new $controllerClassName($view);
        $controller->$doMethodName();

        $view->render();
    } else {
        http_response_code(404);
        new \ppa\Library\ErrorMsg('Page not found: '.$controllerClassName.'::'.$doMethodName); 

    }

?>
