<?php

namespace ppa\Model;

class WorkshopModel extends Database
{
    public function selectWorkshops()
    {
        $sql = 'SELECT workshop.id, firstname, lastname, email, category.description as category
        , workshop.description, title, maxParticipants
        , location, price, image.filename, eventDate
        FROM workshop
        JOIN category ON category.id = categoryId
        JOIN user ON user.id = userId
        JOIN image ON image.id = workshop.imageId
        ORDER BY eventDate';

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