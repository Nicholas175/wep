<?php

namespace ppa\Controller;

use ppa\Model\GalleryModel;
use ppa\Library\View;

class GalleryController
{
    protected $view;
    private $galleryModel;

    public function __construct($view)
    {
        $this->galleryModel = new GalleryModel();
        $this->view = $view;
    }
    
    public function showAllPhotos()
    {
        $this->view->setVars([
            'photos' => $this->galleryModel->selectPhotos()
        ]);
    }
    
}