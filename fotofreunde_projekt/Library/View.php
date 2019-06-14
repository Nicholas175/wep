<?php
namespace ppa\Library;

class View
{
	protected $path, $controller, $do, $vars = [];

	/**
	 * @param string $path           Basepath of the views.
	 * @param string $controllerName Current controller.
	 * @param string $actionName     Current action.
	 */
	public function __construct($path, $controllerName, $doMethodName)
	{
		$this->path = $path;
		$this->controller = $controllerName;
		$this->do = $doMethodName;
	}

	/**
	 * Set view vars. The keys will be added, to existing keys.
	 *
	 * @param array $vars
	 */
	public function setVars(array $vars)
	{
		foreach ($vars as $key => $val) {
			$this->vars[$key] = $val;
		}
	}
        
	public function setDoMethodName($doMethodName)
	{
		$this->do = $doMethodName;
	}

	/**
	 * Render the view.
	 *
	 * @throws NotFoundException
	 */
	public function render()
	{
		$fileName = $this->path.DIRECTORY_SEPARATOR.$this->controller.DIRECTORY_SEPARATOR.$this->do.'.phtml';

		if (!file_exists($fileName)) {
			echo "Fehler";
			exit();
		}

		// spare the view the bloat of using "$this->vars[]" for every variable
		foreach ($this->vars as $key => $val) {
			$$key = $val;
		}

		include $fileName;
	}
}