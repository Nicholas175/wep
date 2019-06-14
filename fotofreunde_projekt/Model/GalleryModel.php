<?php

namespace ppa\Model;
use ppa\Model\ParticipantModel;

class GalleryModel extends Database
{
    public function selectPhotos()
    {
        $sql = "SELECT title, filename, category.description, firstname, gallery.created
                    , image.description as alt, categoryId 
                FROM gallery
                    JOIN category ON category.id = categoryId
                    JOIN user ON user.id = userId
                    JOIN image ON image.id = gallery.imageId
                ORDER BY gallery.created DESC";

        $pdo = $this->linkDB();

        try {
            $res = $pdo->query($sql);
        } catch (\PDOException $e) {
            new \ppa\Library\ErrorMsg("Ihre Anfrage konnte nicht verarbeitet werden", $e); 
            die;
        }

        return $res->fetchAll(\PDO::FETCH_OBJ);
    }
}