<?php
//ini_set('error_reporting', E_ALL);
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
// определим кодировку UTF-8
header("HTTP/1.1 200 OK");
header('Content-type: text/html; charset=utf-8');
// создаем объект магазина
$newShop = new FermaDoma();
// запускаем магазин
$newShop->init();

/** Класс Магазина
 * Class FermaDoma
 */
class FermaDoma
{
    // первичные данные
    private $token = "2126557619:AAFTf530KePpJQH0zPwV2iEoJcP37-HgIic";
    private $admin = 0; // Ваш id в ТЕЛеГРАМ
    private $helloText = "Привет! Я твой персональный помощник из маркетплейса ФермаДома - мы помогаем реализовывать самые свежие продукты сельхозпроизводителей по выгодным ценам без посредников! /lc - заказы";
    private $img_path = "img"; // путь до директории с картинками относительно этого файла


    // Яндекс.Кошелек для приема оплаты
    private $receiver = "ЯНДЕКС_КОШЕЛЕК";
    // адрес на который переадресует пользователя в случае успешного платежа
    private $urlBot = "";
    // название магазина
    private $nameShop = "ФермаДома";


    // для соединения с БД
    private $host = 'localhost';
    private $db = '';
    private $user = '';
    private $pass = '';
    private $charset = 'utf8mb4';
    /**
     * @var PDO
     */
    private $pdo;

    //////////////////////////////////
    // Запускаем магазин
    //////////////////////////////////
    /** Стартуем  бота
     * @return bool
     */
    public function init()
    {
        // создаем соединение с базой данных
        $this->setPdo();
        // получаем данные от АПИ и преобразуем их в ассоциативный массив
        $rawData = json_decode(file_get_contents('php://input'), true);
        // направляем данные из бота в метод
        // для определения дальнейшего выбора действий
        $this->router($rawData);
        // в любом случае вернем true для бот апи
        return true;
    }

    /** Роутер - Определяем что делать с запросом от АПИ
     * @param $data
     * @return bool
     */
    private function router($data)
    {
        // берем технические данные id чата пользователя == его id и текст который пришел
        $chat_id = $this->getChatId($data);
        $text = $this->getText($data);

        // если пришли данные message
        if (array_key_exists("message", $data)) {
            // дастаем действие админа из базы
            $action = $this->getAdminAction();
            $actionUser = $this->getUserAction($chat_id);

            // текстовые данные
            if (array_key_exists("text", $data['message'])) {
                // если это пришел старт бота
                if ($text == "/start") {
                    $this->startBot($chat_id, $data);
                } elseif ($text == "/admin" && $this->isAdmin($chat_id)) {
                    // выводим страницу только админу
                    $this->adminPage();
                } elseif ($text == "/admincategory" && $this->isAdmin($chat_id)) {
                    // Страница админ категорий
                    $this->adminCategory();
                } elseif ($text == "/addcategory" && $this->isAdmin($chat_id)) {
                    // отправляем на добавление категории
                    $this->addCategory();
                } elseif ($text == "/admincontact" && $this->isAdmin($chat_id)) {
                    // просмотр контактов
                    $this->adminContact();
                } elseif ($text == "/orders" && $this->isAdmin($chat_id)) {
                    // просмотр заказов
                    $this->showOrders();
                } elseif ($text == "/lc") {
                    // просмотр заказов для пользователя
                    $this->userLc($chat_id);
                } else { // другие текстовые сообщения
                    // смотрим куда отправить данные
                    if ($action == "addcategory" && $this->isAdmin($chat_id)) {
                        // если ждем данные для добавления категории
                        $this->adderCategory($text);
                    } elseif (preg_match("~^addproduct_1_~", $action) && $this->isAdmin($chat_id)) {
                        // если ждем данные для добавления товара step_1 - название
                        $param = explode("_", $action);
                        // отправляем на добавление описания
                        $this->addProductName($param['2'], $text);
                    } elseif (preg_match("~^addproduct_2_~", $action) && $this->isAdmin($chat_id)) {
                        // если ждем данные для добавления товара step_2 - описание
                        $param = explode("_", $action);
                        // отправляем на добавление описания
                        $this->addProductDescription($param['2'], $param['3'], $text);
                    } elseif (preg_match("~^addproduct_3_~", $action) && $this->isAdmin($chat_id)) {
                        // если ждем данные для добавления товара step_3 - единица измерения
                        $param = explode("_", $action);
                        // отправляем на добавление описания
                        $this->addProductPrice($param['2'], $param['3'], $text);
                    } elseif (preg_match("~^addproduct_4_~", $action) && $this->isAdmin($chat_id)) {
                        // если ждем данные для добавления товара step_4 - цена
                        $param = explode("_", $action);
                        // отправляем на добавление описания
                        $this->addProductUnit($param['2'], $param['3'], $text);
                    } elseif (preg_match("~^addcontact_~", $action) && $this->isAdmin($chat_id)) {
                        // если ждем данные для для редактирования контактов
                        $param = explode("_", $action);
                        // отправляем данные на редактирование контактов
                        $this->rederContact($param[1], $text);
                    } elseif (preg_match("~^step_1_phone$~", $actionUser)) {
                        // если ждем данные для добавления телефона
                        $this->savePhoneUser($text, $data);
                    } elseif (preg_match("~^step_2_adress$~", $actionUser)) {
                        // если ждем данные для добавления адреса
                        $this->saveAdressUser($text, $data);
                    } else { // если не ждем никаких данных
                        $this->sendMessage($chat_id, "Нам пока не нужны эти данные. Спасибо.");
                    }
                }
            } elseif (array_key_exists("photo", $data['message'])) {
                // если пришли картинки то обрабатываем если ждем
                if (preg_match("~^addproduct_5_~", $action) && $this->isAdmin($chat_id)) {
                    // если ждем данные для добавления товара step_5 - картинка
                    $param = explode("_", $action);
                    // берем данные картинки
                    $file_id = end($data['message']['photo'])['file_id'];
                    // отправляем на добавление описания
                    $this->addProductPhoto($param['2'], $param['3'], $file_id);
                } else { // если не ждем картинок то предупереждение
                    $this->sendMessage($chat_id, "Нам пока не нужны эти данные. Спасибо.");
                }
            } else { // другие данные - документы стикеры аудио ...
                $this->sendMessage($chat_id, "Нам пока не нужны эти данные. Спасибо.");
            }
        } // если пришел запрос на функцию обратного вызова
        elseif (array_key_exists("callback_query", $data)) {
            // смотрим какая функция вызывается
            $func_param = explode("_", $text);
            // определяем функцию в переменную
            $func = $func_param[0];
            // вызываем функцию передаем ей весь объект
            $this->$func($data['callback_query']);
        } // Здесь пришли пока не нужные нам форматы
        else {
            // вернем текст с ошибкой
            $this->sendMessage($chat_id, "Нам пока не нужны эти данные. Спасибо.");
        }
        return true;
    }

    //////////////////////////////////
    // Рабочие методы
    //////////////////////////////////
    /** Обновляем контакты
     * @param $id
     * @param $text
     */
    private function rederContact($id, $text)
    {
        // запрос на обновление данных
        $update = $this->pdo->prepare("UPDATE bot_shop_contact SET description = :description WHERE id = :id");
        // если обновили то выводим контакты
        if ($update->execute(['id' => $id, 'description' => $text])) {
            // очищаем действия админа
            $this->adminActionCancel();
            // выводим страницу контактов
            $this->adminContact();
        } else {
            $this->sendMessage($this->admin, "Ошибка при обновлении контактов. \n/admin");
        }
    }

    /** Форма для редактирования контактов
     * @param $data
     */
    private function redContact($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        if ($this->setActionAdmin("addcontact_" . $param[1])) {
            // готовим данные
            $text = "<b>Текущая версия данных:</b>\n";
            $text .= $this->prepareContact()[0] . "\n\n";
            $text .= "Добавьте новое описание:";
            // создаем массив с данными
            $fields = [
                'chat_id' => $this->admin,
                'text' => $text,
                'parse_mode' => 'html',
                'message_id' => $data['message']['message_id'],
            ];
            // отправляем данные
            // отправляем на изменение сообщения
            $upMessage = $this->botApiQuery("editMessageText", $fields);
            // если обновление прошло успешно
            if ($upMessage['ok']) {
                $this->notice($data['id'], "Укажите новые данные");
            } else {
                $this->notice($data['id'], "Ошибка отображения формы");
            }
        } else {
            $this->notice($data['id'], "Ошибка обновления действия");
        }
    }

    /**
     *  выводим админу контакты с кнопкой для редактирования
     */
    private function adminContact()
    {
        //очищаем временную таблицу
        $this->cleareTempProduct();
        // очищаем действия админа
        $this->adminActionCancel();
        // получаем данные
        $item = $this->prepareContact();
        // добавляем кнопку назад
        $buttons[] = [
            $this->buildInlineKeyBoardButton("Редактировать", "redContact_" . $item[1]),
        ];
        // готовим данные
        $fields = [
            'chat_id' => $this->admin,
            'text' => "<b>Контакы магазина</b>\n\n" . $item[0] . "\n\n/admin",
            'parse_mode' => 'html',
            'reply_markup' => $this->buildInlineKeyBoard($buttons),
        ];
        // отправляем данные
        $this->botApiQuery("sendMessage", $fields);
    }

    /** получаем значение контактов
     * @return array
     */
    private function prepareContact()
    {
        // получаем значение контактов
        $contact = $this->pdo->query("SELECT * FROM bot_shop_contact ORDER BY id DESC LIMIT 1");
        // парсим в массив
        $item = $contact->fetch();
        // возвращаем результат
        return [$item['description'], $item['id']];
    }

    /** просмотр товара
     * @param $data
     */
    private function showProduct($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // данные товара
            $item = $checkHref->fetch();
            // название категории
            $catName = $this->pdo->prepare("SELECT name FROM bot_shop_category WHERE id = :id");
            $catName->execute(['id' => $item['parent']]);
            // добавляем кнопку назад
            $buttons[] = [
                $this->buildInlineKeyBoardButton("Назад", "showCategory_" . $item['parent']),
            ];

            $text = "Просмотр товара в категории: " . $catName->fetch()['name'] . "\n\n";

            $text .= $this->prepareProduct($param[1]);

            $fields = [
                'chat_id' => $this->admin,
                'text' => $text,
                'parse_mode' => 'html',
                'message_id' => $data['message']['message_id'],
                'reply_markup' => $this->buildInlineKeyBoard($buttons),
            ];
            // отправляем на изменение сообщения
            $upMessage = $this->botApiQuery("editMessageText", $fields);
            // если обновление прошло успешно
            if ($upMessage['ok']) {
                $this->notice($data['id'], "Товар показан");
            } else {
                $this->notice($data['id'], "Ошибка отображения товара");
            }
        }
    }

    /** удаляем категорию
     * @param $data
     */
    private function deleteProduct($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // готовим запрос
            $deleteSql = $this->pdo->prepare("DELETE FROM bot_shop_product WHERE id = :id");
            // удаляем категорию
            if ($deleteSql->execute(['id' => $param[1]])) {
                // данные товара
                $item = $checkHref->fetch();
                // название категории
                $catName = $this->pdo->prepare("SELECT name FROM bot_shop_category WHERE id = :id");
                $catName->execute(['id' => $item['parent']]);
                // получаем массив данных для обновления
                $fields = $this->prepareCategory($catName->fetch()['name'], $item['parent']);
                // добавляем к массиву id сообщения
                $fields['message_id'] = $data['message']['message_id'];
                // отправляем на изменение сообщения
                $upMessage = $this->botApiQuery("editMessageText", $fields);
                // если обновление прошло успешно
                if ($upMessage['ok']) {
                    $this->notice($data['id'], "Товар удален");
                } else {
                    $this->notice($data['id'], "Ошибка отображения изменений");
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка удаления товара.");
            }
        }
    }

    /** Изменение видимости товара
     * @param $data
     */
    private function hideProduct($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // определяем видимость если был 1 ставим 0 и наоборот
            $hide = $param[2] ? 0 : 1;
            // готовим запрос
            $updateSql = $this->pdo->prepare("UPDATE bot_shop_product SET hide = :hide WHERE id = :id");
            // обновляем видимость
            if ($updateSql->execute(['hide' => $hide, 'id' => $param[1]])) {
                // данные товара
                $item = $checkHref->fetch();
                // название категории
                $catName = $this->pdo->prepare("SELECT name FROM bot_shop_category WHERE id = :id");
                $catName->execute(['id' => $item['parent']]);
                // получаем массив данных для обновления
                $fields = $this->prepareCategory($catName->fetch()['name'], $item['parent']);
                // добавляем к массиву id сообщения
                $fields['message_id'] = $data['message']['message_id'];
                // отправляем на изменение сообщения
                $upMessage = $this->botApiQuery("editMessageText", $fields);
                // если обновление прошло успешно
                if ($upMessage['ok']) {
                    $this->notice($data['id'], "Видимость изменена");
                } else {
                    $this->notice($data['id'], "Ошибка отображения изменений");
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка изменения видимости товара");
            }
        }
    }

    /** Добавляем картинку и заканчиваем с добавлением товара
     * @param $category
     * @param $product
     * @param $file_id
     */
    private function addProductPhoto($category, $product, $file_id)
    {
        // запрос на проверку есть ли такая временная запись товара в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product_temp WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $product]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() !== 0) {
            // получаем картинку
            $photo = $this->getPhoto($file_id);
            if ($photo) {
                // Добавляем в основную таблицу новый товар
                $insert = $this->pdo->prepare("INSERT INTO bot_shop_product SET parent = :parent, name = :name, description = :description, price = :price, unit = :unit, image_tlg = :image_tlg, image = :image, hide = 1");
                // достаем временные данные
                $item = $checkHref->fetch();
                // готовим данные
                $array = [
                    'parent' => $category,
                    'name' => $item['name'],
                    'description' => $item['description'],
                    'price' => $item['price'],
                    'unit' => $item['unit'],
                    'image_tlg' => $file_id,
                    'image' => $photo
                ];
                // если удалось добавить товар
                if ($insert->execute($array)) {
                    //очищаем временную таблицу
                    $this->cleareTempProduct();
                    // очищаем действия админа
                    $this->adminActionCancel();
                    // название категории
                    $catName = $this->pdo->prepare("SELECT name FROM bot_shop_category WHERE id = :id");
                    $catName->execute(['id' => $category]);
                    // выводим список товаров
                    $fields = $this->prepareCategory($catName->fetch()['name'], $category);
                    // обновляем сообщение - выводим список товаров
                    $this->botApiQuery("sendMessage", $fields);
                } else {
                    $this->sendMessage($this->admin, "Ошибка при добавлении товара 0");
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка при добавлении товара 1");
            }
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении товара 2");
        }
    }

    /** общая функция загрузки картинки
     * @param $file_id
     * @return bool|string
     */
    private function getPhoto($file_id)
    {
        // получаем file_path
        $file_path = $this->getPhotoPath($file_id);
        // возвращаем результат загрузки фото
        return $this->copyPhoto($file_path);
    }

    /** функция получения метонахождения файла
     * @param $file_id
     * @return mixed
     */
    private function getPhotoPath($file_id)
    {
        // получаем объект File
        $array = $this->botApiQuery("getFile", ['file_id' => $file_id]);
        // возвращаем file_path
        return $array['result']['file_path'];
    }

    /** копируем фото к себе
     * @param $file_path
     * @return bool|string
     */
    private function copyPhoto($file_path)
    {
        // ссылка на файл в телеграме
        $file_from_tgrm = "https://api.telegram.org/file/bot" . $this->token . "/" . $file_path;
        // достаем расширение файла
        $ext = end(explode(".", $file_path));
        // назначаем свое имя здесь время_в_секундах.расширение_файла
        $name_our_new_file = $this->img_path . "/" . time() . "." . $ext;
        // возвращаем путь картинки или false
        return copy($file_from_tgrm, $name_our_new_file) ? $name_our_new_file : false;
    }

    /** Добавляем еденицу измерения
     * @param $category
     * @param $product
     * @param $text
     */
    private function addProductUnit($category, $product, $text)
    {
        // запрос на проверку есть ли такая временная запись товара в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product_temp WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $product]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() !== 0) {
            // готовим запрос
            $update = $this->pdo->prepare("UPDATE bot_shop_product_temp SET unit = :unit WHERE id = :id");
            // если добавление успешно то просим добавить описание
            if ($update->execute(['id' => $product, 'unit' => $text])) {
                // Добавляем дейсвтие админа для описания
                if ($this->setActionAdmin("addproduct_5_" . $category . "_" . $product)) {
                    // название категории
                    $cat = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
                    // выполняем запрос
                    $cat->execute(['id' => $category]);
                    // готовим текст
                    $text = "Процесс добавления товара в категорию: " . $cat->fetch()['name'] . "\n\n";
                    // получаем все о товаре
                    $text .= $this->prepareProduct($product, "_temp");
                    // добавляем инструкцию
                    $text .= "\nДобавьте картинку для товара:";
                    // добавляем кнопку отменить
                    $buttons[] = [
                        $this->buildInlineKeyBoardButton("Отменить", "addProductCancel_" . $category . "_" . $product),
                    ];
                    $fields = [
                        'chat_id' => $this->admin,
                        'text' => $text,
                        'reply_markup' => $this->buildInlineKeyBoard($buttons),
                        'parse_mode' => 'html',
                    ];
                    // отправляем на изменение сообщения
                    $this->botApiQuery("sendMessage", $fields);
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка при добавлении товара 1");
            }
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении товара 2");
        }
    }

    /** Добавляем цену
     * @param $category
     * @param $product
     * @param $text
     */
    private function addProductPrice($category, $product, $text)
    {
        // запрос на проверку есть ли такая временная запись товара в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product_temp WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $product]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() !== 0) {
            // проверить данные на число и привестви их к модулю
            if (!is_numeric($text)) {
                $this->sendMessage($this->admin, "Цена должна быть числом. Попробуйте еще раз.");
            } else {
                // приводим к модулю числу
                $text = abs($text);
                // готовим запрос
                $update = $this->pdo->prepare("UPDATE bot_shop_product_temp SET price = :price WHERE id = :id");
                // если добавление успешно то просим добавить описание
                if ($update->execute(['id' => $product, 'price' => $text])) {
                    // Добавляем дейсвтие админа для описания
                    if ($this->setActionAdmin("addproduct_4_" . $category . "_" . $product)) {
                        // название категории
                        $cat = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
                        // выполняем запрос
                        $cat->execute(['id' => $category]);
                        // готовим текст
                        $text = "Процесс добавления товара в категорию: " . $cat->fetch()['name'] . "\n\n";
                        // получаем все о товаре
                        $text .= $this->prepareProduct($product, "_temp");
                        // добавляем инструкцию
                        $text .= "\nДобавьте еденицу измерения:";
                        // добавляем кнопку отменить
                        $buttons[] = [
                            $this->buildInlineKeyBoardButton("Отменить", "addProductCancel_" . $category . "_" . $product),
                        ];
                        $fields = [
                            'chat_id' => $this->admin,
                            'text' => $text,
                            'reply_markup' => $this->buildInlineKeyBoard($buttons),
                            'parse_mode' => 'html',
                        ];
                        // отправляем на изменение сообщения
                        $this->botApiQuery("sendMessage", $fields);
                    }
                } else {
                    $this->sendMessage($this->admin, "Ошибка при добавлении товара 1");
                }
            }
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении товара 2");
        }
    }

    /** Добавление описания
     * @param $category
     * @param $product
     * @param $text
     */
    private function addProductDescription($category, $product, $text)
    {
        // запрос на проверку есть ли такая временная запись товара в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product_temp WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $product]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() !== 0) {
            $update = $this->pdo->prepare("UPDATE bot_shop_product_temp SET description = :description WHERE id = :id");
            // если добавление успешно то просим добавить описание
            if ($update->execute(['id' => $product, 'description' => $text])) {
                // Добавляем дейсвтие админа для описания
                if ($this->setActionAdmin("addproduct_3_" . $category . "_" . $product)) {
                    // название категории
                    $cat = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
                    // выполняем запрос
                    $cat->execute(['id' => $category]);
                    // готовим текст
                    $text = "Процесс добавления товара в категорию: " . $cat->fetch()['name'] . "\n\n";
                    // получаем все о товаре
                    $text .= $this->prepareProduct($product, "_temp");
                    // добавляем инструкцию
                    $text .= "\nДобавьте цену товара в формате 0.00 (целое и положительное):";
                    // добавляем кнопку отменить
                    $buttons[] = [
                        $this->buildInlineKeyBoardButton("Отменить", "addProductCancel_" . $category . "_" . $product),
                    ];
                    $fields = [
                        'chat_id' => $this->admin,
                        'text' => $text,
                        'reply_markup' => $this->buildInlineKeyBoard($buttons),
                        'parse_mode' => 'html',
                    ];
                    // отправляем на изменение сообщения
                    $this->botApiQuery("sendMessage", $fields);
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка при добавлении товара 1");
            }
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении товара 2");
        }
    }

    /** Добавляем товар во временную таблицу и добавляем название
     * @param $id
     * @param $text
     */
    private function addProductName($id, $text)
    {
        // Добавляем название во временную таблицу
        $insert = $this->pdo->prepare("INSERT INTO bot_shop_product_temp SET parent = :id, name = :name");
        // если добавление успешно то просим добавить описание
        if ($insert->execute(['id' => $id, 'name' => $text])) {
            // получаем добавленный id
            $idProduct = $this->pdo->lastInsertId();
            // Добавляем дейсвтие админа для описания
            if ($this->setActionAdmin("addproduct_2_" . $id . "_" . $idProduct)) {
                // название категории
                $category = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
                // выполняем запрос
                $category->execute(['id' => $id]);
                // готовим текст
                $text = "Процесс добавления товара в категорию: " . $category->fetch()['name'] . "\n\n";
                // получаем все о товаре
                $text .= $this->prepareProduct($idProduct, "_temp");
                // добавляем инструкцию
                $text .= "\nДобавьте описание товара:";
                // добавляем кнопку отменить
                $buttons[] = [
                    $this->buildInlineKeyBoardButton("Отменить", "addProductCancel_" . $id . "_" . $idProduct),
                ];
                $fields = [
                    'chat_id' => $this->admin,
                    'text' => $text,
                    'reply_markup' => $this->buildInlineKeyBoard($buttons),
                    'parse_mode' => 'html',
                ];
                // отправляем на изменение сообщения
                $this->botApiQuery("sendMessage", $fields);
            }
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении товара");
        }
    }

    /** готовим информацию о товаре
     * @param $id
     * @param string $type
     * @return bool|string
     */
    private function prepareProduct($id, $type = "")
    {
        $product = $this->pdo->prepare("SELECT * FROM bot_shop_product" . $type . " WHERE id = :id");
        $product->execute(['id' => $id]);
        if ($product->rowCount() === 0) {
            return false;
        } else {
            $item = $product->fetch();
            // создаем переменную для складирования текста
            $text = "";
            // данные картикни
            if (empty($item['image'])) {
                $image = "Не загружена";
            } else {
                // получаем путь относительно домена
                $path = $_SERVER['PHP_SELF'];
                // получаем вхождение последнего слеша
                $path_len = mb_strripos($_SERVER['PHP_SELF'], "/");
                // отрезаем имя файла - получаем путь до текущей директории
                $path_new = mb_strcut($path, 0, $path_len + 1);
                $image = "";
                $text .= "<a href='https://" . $_SERVER['SERVER_NAME'] . $path_new . $item['image'] . "'>&#8203;&#8203;</a>";
            }
            $text .= "<b>Название: </b>" . $item['name'] . "\n";
            $text .= "<b>Описание: </b>" . $item['description'] . "\n";
            $text .= "<b>Цена: </b>" . $item['price'] . "\n";
            $text .= "<b>Ед.изм: </b>" . $item['unit'] . "\n";
            $text .= "<b>Картинка: </b>" . $image . "\n";
            // возвращаем данные
            return $text;
        }
    }

    /** Отменяем добавление товара
     * @param $data
     * @return bool
     */
    private function addProductCancel($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // проверяем есть ли такая запись в базе если это не 0
        if ($param[2] != 0) {
            // запрос на проверку есть ли такая временная запись товара в базе
            $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product_temp WHERE id = :id");
            // выполняем запрос
            $checkHref->execute(['id' => $param[2]]);
            // если вернулось ноль строк
            if ($checkHref->rowCount() === 0) {
                // выводим уведомление
                $this->notice($data['id'], "Ссылка устарела");
                // удаляем сообщение с кнопками из чата
                $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
                // остановим выполнение скрипта
                return true;
            }
        }
        // очищаем действие админа
        if ($this->adminActionCancel()) {
            // удаляем из временной таблицы все
            if (!$this->cleareTempProduct()) {
                $this->notice($data['id'], "Ошибка удаления товара");
            } else {
                // возвращаемся к просмотру категории
                // запрос на проверку есть ли такая категория в базе
                $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
                // выполняем запрос
                $checkHref->execute(['id' => $param[1]]);
                // если вернулось ноль строк
                if ($checkHref->rowCount() === 0) {
                    // выводим ошибку
                    $this->notice($data['id'], "Ссылка устарела");
                    // удаляем сообщение с кнопками из чата
                    $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
                } else {
                    // выводим список товаров
                    $fields = $this->prepareCategory($checkHref->fetch()['name'], $param[1]);
                    // добавляем к массиву id сообщения
                    $fields['message_id'] = $data['message']['message_id'];
                    // обновляем сообщение - выводим список товаров
                    $upMessage = $this->botApiQuery("editMessageText", $fields);
                    // если обновление сообщения прошло успешно
                    if ($upMessage['ok']) {
                        $this->notice($data['id'], "Просмотр категории");
                    } else {
                        $this->notice($data['id'], "Ошибка отображения категории");
                    }
                }
            }
        } else {
            $this->notice($data['id'], "Ошибка при очистке действий админа");
        }
    }

    /** Очищаем временную таблицу товаров
     * @return mixed
     */
    private function cleareTempProduct()
    {
        return $this->pdo->query("DELETE FROM bot_shop_product_temp");
    }

    /** выводим категории по кнопке назад
     * @param $data
     * @return bool
     */
    private function addProduct($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // очищаем врем.табл
        if (!$this->cleareTempProduct()) {
            // выводим ошибку и останавливаем скрипт
            $this->notice($data['id'], "Ошибка очистки временной таблицы");
            return true;
        }
        // если удалось поставить действие админа
        if ($this->setActionAdmin("addproduct_1_" . $param[1])) {
            // название категории
            $category = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
            // выполняем запрос
            $category->execute(['id' => $param[1]]);
            // готовим текст
            $text = "Процесс добавления товара в категорию: " . $category->fetch()['name'] . "\n\n";
            // кнопка для отмены добавления
            $buttons[] = [
                $this->buildInlineKeyBoardButton("Отменить", "addProductCancel_" . $param[1] . "_0"),
            ];
            // готовим данные для отправки
            $fields = [
                'chat_id' => $this->admin,
                'message_id' => $data['message']['message_id'],
                'text' => $text . 'Добавьте название товара:',
                'reply_markup' => $this->buildInlineKeyBoard($buttons),
            ];
            // отправляем на изменение сообщения
            $upMessage = $this->botApiQuery("editMessageText", $fields);
            // если обновление прошло успешно
            if ($upMessage['ok']) {
                $this->notice($data['id'], "Добавьте название");
            } else {
                $this->notice($data['id'], "Ошибка отображения формы 1");
            }
        } else {
            $this->notice($data['id'], "Ошибка при установке действий админу");
        }
    }

    /** Смотрим категорию
     * @param $data
     */
    private function showCategory($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // выводим список товаров
            $fields = $this->prepareCategory($checkHref->fetch()['name'], $param[1]);
            // добавляем к массиву id сообщения
            $fields['message_id'] = $data['message']['message_id'];
            // обновляем сообщение - выводим список товаров
            $upMessage = $this->botApiQuery("editMessageText", $fields);
            // если обновление сообщения прошло успешно
            if ($upMessage['ok']) {
                $this->notice($data['id'], "Просмотр категории");
            } else {
                $this->notice($data['id'], "Ошибка отображения категории");
            }
        }
    }

    /** Готовим данные категории
     * @param $name
     * @param $id
     * @return array
     */
    private function prepareCategory($name, $id)
    {
        // массив кнопок
        $buttons = [];
        // добавляем кнопки назад и добавить
        $buttons[] = [
            $this->buildInlineKeyBoardButton("Назад", "adminCats_0"),
            $this->buildInlineKeyBoardButton("Добавить", "addProduct_" . $id),
        ];
        // получаем товары из базы
        $products = $this->pdo->prepare('SELECT * FROM bot_shop_product WHERE parent = :id');
        $products->execute(['id' => $id]);
        // проходим циклом по полученным данным из базы
        while ($row = $products->fetch()) {
            // здесь в качестве иконок эмодзи - возможно их не будет видно в редакторе, но они здесь есть
            // выводим иконку для понимания видимости
            $hideIcon = $row['hide'] ? 'Показать' : 'Скрыть';
            // формируем кнопки одна для изменения видимости другая для удаления
            $buttons[] = [
                $this->buildInlineKeyBoardButton($row['name'], "showProduct_" . $row['id']),
                $this->buildInlineKeyBoardButton($hideIcon, "hideProduct_" . $row['id'] . "_" . $row['hide']),
                $this->buildInlineKeyBoardButton("✖", "deleteProduct_" . $row['id']),
            ];
        }
        // первичный набор данных для отправки
        $fields = [
            'chat_id' => $this->admin,
            'parse_mode' => 'html'
        ];
        // определяем текст
        $text = "Товары категории \"" . $name . "\":";
        // смотрим сколько товаров
        if ($products->rowCount() === 0) {
            // если нет категорий то выводим информ
            $text .= "\nЕще нет товаров в базе для этой категории.";
        }
        // выводим кнопки
        $fields['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        // добавляем в данные текст
        $fields['text'] = $text;
        // возвращаем массив
        return $fields;
    }

    /** удаляем категорию
     * @param $data
     */
    private function deleteCategory($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // готовим запрос
            $deleteSql = $this->pdo->prepare("DELETE FROM bot_shop_category WHERE id = :id");
            // удаляем категорию
            if ($deleteSql->execute(['id' => $param[1]])) {
                //удаление всех товаров и картинок в категории
                $products = $this->pdo->prepare("SELECT id, image FROM bot_shop_product WHERE parent = :parent");
                if ($products->execute(['parent' => $param[1]])) {
                    while ($item = $products->fetch()) {
                        @unlink($item['image']);
                        $this->pdo->query("DELETE FROM bot_shop_product WHERE id = " . $item['id']);
                    }
                }
                // получаем массив данных для обновления
                $fields = $this->prepareAdminCategory();
                // добавляем к массиву id сообщения
                $fields['message_id'] = $data['message']['message_id'];
                // отправляем на изменение сообщения
                $upMessage = $this->botApiQuery("editMessageText", $fields);
                // если обновление прошло успешно
                if ($upMessage['ok']) {
                    $this->notice($data['id'], "Категория удалена");
                } else {
                    $this->notice($data['id'], "Ошибка отображения изменений");
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка удаления категории.");
            }
        }
    }

    /** Изменение видимости категории
     * @param $data
     */
    private function hideCategory($data)
    {
        // берем необходимую строку с данными
        $obj = $data['data'];
        // разбиваем в массив
        $param = explode("_", $obj);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_category WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // определяем видимость если был 1 ставим 0 и наоборот
            $hide = $param[2] ? 0 : 1;
            // готовим запрос
            $updateSql = $this->pdo->prepare("UPDATE bot_shop_category SET hide = :hide WHERE id = :id");
            // обновляем видимость
            if ($updateSql->execute(['hide' => $hide, 'id' => $param[1]])) {
                // получаем массив данных для обновления
                $fields = $this->prepareAdminCategory();
                // добавляем к массиву id сообщения
                $fields['message_id'] = $data['message']['message_id'];
                // отправляем на изменение сообщения
                $upMessage = $this->botApiQuery("editMessageText", $fields);
                // если обновление прошло успешно
                if ($upMessage['ok']) {
                    $this->notice($data['id'], "Видимость изменена");
                } else {
                    $this->notice($data['id'], "Ошибка отображения изменений");
                }
            } else {
                $this->sendMessage($this->admin, "Ошибка изменения видимости категории");
            }
        }
    }

    /** Добавляем категорию
     * @param $name
     */
    private function adderCategory($name)
    {
        // делаем запрос на добавление категории, по умолчанию делаем ее не видимой
        $insertSql = $this->pdo->prepare("INSERT INTO bot_shop_category SET name = :name, hide = 1");
        // возвращаем результат
        if ($insertSql->execute(['name' => $name])) {
            // если добавили то удаляем действия админа
            if (!$this->adminActionCancel()) {
                $this->sendMessage($this->admin, "Категорию добавили, но не смогли удалить действия админа во временной таблице");
            }
            // выводим категории в любом случае
            $this->adminCategory();
        } else {
            $this->sendMessage($this->admin, "Ошибка при добавлении категории");
        }
    }

    /**
     *  Форма для добавления категории
     */
    private function addCategory()
    {
        // если удалось поставить действие админа
        if ($this->setActionAdmin("addcategory")) {
            // выводим инструкцию
            $this->sendMessage($this->admin, "Для добавления категории, отправьте наименование:");
        }
    }

    /** Отменяем все действия админа
     * @return mixed
     */
    private function adminActionCancel()
    {
        // возвращаем результат запроса
        return $this->pdo->query("DELETE FROM bot_shop_action_admin");
    }

    /** Получаем действие админа из таблицы
     * @return bool
     */
    private function getAdminAction()
    {
        // достаем из базы
        $last = $this->pdo->query("SELECT name FROM bot_shop_action_admin ORDER BY id DESC LIMIT 1");
        // преобразуем строку в массив
        $lastAction = $last->fetch();
        // если есть значение то возвращаем его иначе false
        return isset($lastAction['name']) ? $lastAction['name'] : false;
    }

    /** Записываем действие админа
     * @param $action
     * @return mixed
     */
    private function setActionAdmin($action)
    {
        // отменяем все действия админа
        if ($this->adminActionCancel()) {
            // готовим запрос
            $insertSql = $this->pdo->prepare("INSERT INTO bot_shop_action_admin SET name = :name");
            // возвращаем результат
            return $insertSql->execute(['name' => $action]);
        } else {
            // выводим ошибку
            $this->sendMessage($this->admin, "Ошибка отмены предыдущих действий.");
        }
    }

    /** Страница админа
     *
     */
    private function adminPage()
    {
        // готовим
        $text = "Администрирование\n   /admincategory - Категории\n   /admincontact - Контакты \n   /orders - заказы";
        // выводим
        $this->sendMessage($this->admin, $text);
    }

    /**
     * выводим категории
     */
    private function adminCategory()
    {
        //очищаем временную таблицу
        $this->cleareTempProduct();
        // очищаем действия админа
        $this->adminActionCancel();
        // получаем данные
        $fields = $this->prepareAdminCategory();
        // отправляем данные админу
        $this->botApiQuery("sendMessage", $fields);
    }

    /** выводим категории по кнопке назад
     * @param $data
     */
    private function adminCats($data)
    {
        $fields = $this->prepareAdminCategory();
        // добавляем к массиву id сообщения
        $fields['message_id'] = $data['message']['message_id'];
        // отправляем на изменение сообщения
        $upMessage = $this->botApiQuery("editMessageText", $fields);
        // если обновление прошло успешно
        if ($upMessage['ok']) {
            $this->notice($data['id'], "Список категорий");
        } else {
            $this->notice($data['id'], "Ошибка отображения категорий");
        }
    }

    /** готовим категории
     * @return array
     */
    private function prepareAdminCategory()
    {
        // создаем массив для кнопок
        $buttons = [];
        // получаем категории из базы
        $category = $this->pdo->query('SELECT * FROM bot_shop_category');
        // проходим циклом по полученным данным из базы
        while ($row = $category->fetch()) {
            // здесь в качестве иконок эмодзи - возможно их не будет видно в редакторе, но они здесь есть
            // выводим иконку для понимания видимости
            $hideIcon = $row['hide'] ? 'Показать' : 'Скрыть';
            // формируем кнопки однадля изменения видимости другая для удаления
            $buttons[] = [
                $this->buildInlineKeyBoardButton($row['name'], "showCategory_" . $row['id']),
                $this->buildInlineKeyBoardButton($hideIcon, "hideCategory_" . $row['id'] . "_" . $row['hide']),
                $this->buildInlineKeyBoardButton("✖", "deleteCategory_" . $row['id']),
            ];
        }
        // первичный набор данных для отправки
        $fields = [
            'chat_id' => $this->admin,
            'parse_mode' => 'html'
        ];
        // определяем текст
        $text = "/addcategory - добавить категорию\n/admin - вернуться\n\nКатегории:";
        // смотрим сколько категорий
        if (count($buttons) == 0) {
            // если нет категорий то выводим информ
            $text .= "\nЕще нет категорий в базе.";
        } else {
            // если есть категории то выводим кнопки
            $fields['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        }
        // добавляем в данные текст
        $fields['text'] = $text;
        // возвращаем результат
        return $fields;
    }


    /** Выводим приветственное слово
     * @param $chat_id
     */
    private function startBot($chat_id, $data)
    {
        // достаем пользователя из базы
        $user = $this->pdo->prepare("SELECT * FROM bot_shop_profile WHERE user_id = :user_id");
        $user->execute(['user_id' => $chat_id]);
        // если такого пользователя нет в базе то пишем его туда
        if ($user->rowCount() == 0) {
            // добавляем пользователя
            $newUser = $this->pdo->prepare("INSERT INTO bot_shop_profile SET user_id = :user_id, first_name = :first_name, last_name = :last_name, phone = :phone, adress = :adress, action = 'start'");
            $newUser->execute([
                'user_id' => $chat_id,
                'first_name' => $data['message']['chat']['first_name'],
                'last_name' => $data['message']['chat']['last_name'],
                'phone' => '',
                'adress' => '',
            ]);
        } else {
            // если пользователь есть то меняем ему действие
            @$this->setActionUser("start", $chat_id);
        }
        // определяем приветственный текст
        $text = $this->helloText;
        // проверяем пользователя на админа
        if ($this->isAdmin($chat_id)) {
            $text .= "\n\n/admin";
        }
        // получаем категории из базы где категории не скрыты
        $category = $this->pdo->query('SELECT * FROM bot_shop_category WHERE hide = 0');
        // проверяем на количество категорий
        if ($category->rowCount() > 0) {
            // проходим циклом по полученным данным из базы
            while ($row = $category->fetch()) {
                // Добавляем кнопки для категорий
                $buttons[][] = $this->buildInlineKeyBoardButton($row['name'], "showUserCategory_" . $row['id']);
            }
        } else {
            // выводим инфу
            $buttons = NULL;
            $text .= "\nВ магазине ничего нет";
        }
        // отправляем привет
        $this->sendMessage($chat_id, $text, $buttons);
    }

    /** Выводим список категорий по запросу кнопки Назад :: inline-вызов
     * @param $data
     */
    private function showCatalog($data)
    {
        // получаем данные
        $chat_id = $this->getChatId($data);
        $message_id = $this->getMessageId($data);
        // меняем дуйствие
        @$this->setActionUser("show_catalog", $chat_id);
        // готовим текст
        $text = $this->helloText;
        // получаем категории из базы где категории не скрыты
        $category = $this->pdo->query('SELECT * FROM bot_shop_category WHERE hide = 0');
        // проверяем на количество категорий
        if ($category->rowCount() > 0) {
            // проходим циклом по полученным данным из базы
            while ($row = $category->fetch()) {
                // Добавляем кнопки для категорий
                $buttons[][] = $this->buildInlineKeyBoardButton($row['name'], "showUserCategory_" . $row['id']);
            }
        } else {
            $buttons = NULL;
            $text .= "\nВ магазине ничего нет";
        }
        // отправляем привет
        $this->editMessageText($chat_id, $message_id, $text, $buttons);
        // уведомляем
        $this->notice($data['id']);
    }

    /** Выводим Категорию пользователю
     * @param $data
     */
    private function showUserCategory($data)
    {
        // получаем данные
        $chat_id = $this->getChatId($data);
        $message_id = $this->getMessageId($data);
        // меняем действие
        @$this->setActionUser("show_category", $chat_id);
        // парсим callback_data
        $param = explode("_", $data['data']);
        // получаем название категории
        $category = $this->pdo->prepare('SELECT name FROM bot_shop_category WHERE id = :id');
        $category->execute(['id' => $param[1]]);
        // записываем название в переменную
        $text = "<b>Категория " . $category->fetch()['name'] . "</b>\n";
        // получаем товары из базы которые не скрыты
        $products = $this->pdo->prepare('SELECT * FROM bot_shop_product WHERE parent = :id AND hide = 0');
        $products->execute(['id' => $param[1]]);
        // проверяем на количество товаров в категории
        if ($products->rowCount() > 0) {
            // проходим циклом по полученным данным из базы
            while ($row = $products->fetch()) {
                // формируем кнопки для просмотра товара
                $buttons[][] = $this->buildInlineKeyBoardButton($row['name'], "showUserProduct_" . $row['id']);
            }
        } else {
            // товаров нет пишем что пусто 
            $text .= "В категории ничего нет";
        }
        // кнопка по умолчанию назад
        $buttons[][] = $this->buildInlineKeyBoardButton("<< Назад", "showCatalog_0");
        // отправляем в метод данные
        $this->editMessageText($chat_id, $message_id, $text, $buttons);
        // уведомляем
        $this->notice($data['id']);
    }

    /** Выводим на просмотр товар
     * @param $data
     */
    private function showUserProduct($data)
    {
        // парсим callback_data
        $param = explode("_", $data['data']);
        $chat_id = $this->getChatId($data);
        // меняем действие
        @$this->setActionUser("show_product", $chat_id);
        // запрос на проверку есть ли такая категория в базе
        $checkHref = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
        // выполняем запрос
        $checkHref->execute(['id' => $param[1]]);
        // если вернулось ноль строк
        if ($checkHref->rowCount() === 0) {
            // выводим ошибку
            $this->notice($data['id'], "Ссылка устарела");
            // удаляем сообщение с кнопками из чата
            $this->botApiQuery("deleteMessage", ['chat_id' => $this->admin, 'message_id' => $data['message']['message_id']]);
        } else {
            // данные товара
            $item = $checkHref->fetch();
            // название категории
            $catName = $this->pdo->prepare("SELECT name FROM bot_shop_category WHERE id = :id");
            $catName->execute(['id' => $item['parent']]);
            // проверяем наличие в корзине
            $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE product_id = :product_id AND user_id = :user_id");
            $check->execute(['product_id' => $param[1], 'user_id' => $this->getChatId($data)]);
            // условие проверки
            if ($check->rowCount() > 0) {
                $count = " (" . $check->fetch()['product_count'] . ")";
            } else {
                $count = "";
            }
            // добавляем кнопку назад
            $buttons[] = [
                $this->buildInlineKeyBoardButton("<< Назад", "showUserCategory_" . $item['parent']),
                $this->buildInlineKeyBoardButton("В корзину" . $count, "addBasket_" . $item['id'] . '_' . $item['parent']),
            ];
            // если товар в корзине есть выводим кнопку на просмотр корзины
            if ($check->rowCount() > 0) {
                $buttons[][] = $this->buildInlineKeyBoardButton("Перейти в корзину", "showBasket_0");
            }
            $text = "Просмотр товара в категории: " . $catName->fetch()['name'] . "\n\n";
            // информация по товару
            $text .= $this->prepareProduct($param[1]);
            // готовим данные для отправки
            $fields = [
                'chat_id' => $chat_id,
                'text' => $text,
                'parse_mode' => 'html',
                'message_id' => $this->getMessageId($data),
                'reply_markup' => $this->buildInlineKeyBoard($buttons),
            ];
            // отправляем на изменение сообщения
            $upMessage = $this->botApiQuery("editMessageText", $fields);
            // если обновление прошло успешно
            if ($upMessage['ok']) {
                $this->notice($data['id'], "Товар показан");
            } else {
                $this->notice($data['id'], "Ошибка отображения товара");
            }
        }
    }

    /** Добавляем товар в корзину
     * @param $data
     * @return bool
     */
    private function addBasket($data)
    {
        // 1 - product_id, 2 - category_id
        $param = explode("_", $data['data']);
        $chat_id = $this->getChatId($data);
        // проверяем есть ли уже в корзине этот товар
        $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE product_id = :product_id AND user_id = :user_id");
        $check->execute(['product_id' => $param[1], 'user_id' => $chat_id]);
        // условие проверки
        if ($check->rowCount() > 0) {
            // пишем количесвто в переменную
            $count = $check->fetch()['product_count'] + 1;
            $updateSql = $this->pdo->prepare("UPDATE bot_shop_basket SET product_count = :product_count  WHERE product_id = :product_id AND user_id = :user_id");
            // обновляем видимость
            if (!$updateSql->execute([
                'product_count' => $count,
                'product_id' => $param[1],
                'user_id' => $chat_id,
            ])) {
                $this->notice($data['id'], "Ошибка_ добавления в корзину", true);
                return true;
            }
        } else {
            // если товара в корзине нет то добавляем в корзину
            $count = 1;
            $insertSql = $this->pdo->prepare("INSERT INTO bot_shop_basket SET product_id = :product_id, product_count = :product_count, user_id = :user_id");
            // возвращаем результат
            if (!$insertSql->execute([
                'product_id' => $param[1],
                'product_count' => $count,
                'user_id' => $chat_id
            ])
            ) {
                $this->notice($data['id'], "Ошибка добавления в корзину", true);
                return true;
            }
        }
        // готовим кнопки
        $buttons[] = [
            $this->buildInlineKeyBoardButton("<< Назад", "showUserCategory_" . $param[2]),
            $this->buildInlineKeyBoardButton("В корзину (" . $count . ")", "addBasket_" . $param[1] . '_' . $param[2]),
        ];
        // добавляем кнопку для перехода в корзину
        $buttons[][] = $this->buildInlineKeyBoardButton("Перейти в корзину", "showBasket_0");
        // готовим данные
        $fields = [
            'chat_id' => $chat_id,
            'message_id' => $this->getMessageId($data),
            'reply_markup' => $this->buildInlineKeyBoard($buttons),
        ];
        // отправляем на изменение сообщения
        $upMessage = $this->botApiQuery("editMessageReplyMarkup", $fields);
        // если обновление прошло успешно
        if ($upMessage['ok']) {
            $this->notice($data['id'], "Товар добавлен в корзину");
        } else {
            $this->notice($data['id'], "_Ошибка добавления в корзину", true);
        }
    }

    /** Выводим корзину
     * @param $data
     */
    private function showBasket($data)
    {
        // получаем данные
        $chat_id = $this->getChatId($data);
        // меняем действие
        @$this->setActionUser("show_basket", $chat_id);
        // Выводим корзину
        $this->showBasketBegin($chat_id, $data);
        // глушим уведомление
        $this->notice($data['id']);
    }

    /** Выводим корзину
     * @param $user_id
     * @param $data
     */
    private function showBasketBegin($user_id, $data)
    {
        // получаем все из корзины пользователя
        $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
        $check->execute(['user_id' => $user_id]);
        // количество в корзине
        $basketCount = $check->rowCount();
        // если в корзине что-то есть
        if ($basketCount > 0) {
            // получаем данные для отрисовки корзины
            $array = $this->drawBasket($user_id, 0, $basketCount);
            $text = $array['text'];
            $buttons = $array['buttons'];
        } else {
            // если в корзине пусто
            $text = "У вас нет добавленных товаров в корзине.";
        }
        // готовим данные для отображения
        $data_send = [
            'chat_id' => $user_id,
            'text' => $text,
            'message_id' => $this->getMessageId($data),
            'parse_mode' => 'html',
        ];
        // проверяем наличие кнопок
        if (is_array($buttons)) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        }
        // отправляем сообщение
        $this->botApiQuery("editMessageText", $data_send);
    }

    /** Рисуем корзину для начала
     * @param $user_id
     * @param $begin
     * @param $basketCount
     * @return array
     */
    private function drawBasket($user_id, $begin, $basketCount)
    {
        // достаем модель из корзины
        $model_basket = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id ORDER BY id DESC LIMIT " . $begin . ", 1");
        $model_basket->execute(['user_id' => $user_id]);
        $basket = $model_basket->fetch();
        // достаем товар
        $product_id = $basket['product_id'];
        // достаем модель продукта
        $model_product = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
        $model_product->execute(['id' => $product_id]);
        // готовим массив для кнопок корзины
        $item['id'] = $basket['id'];
        $item['count'] = $basket['product_count'];
        $item['price'] = $model_product->fetch()['price'];
        // возвращаем результат
        return [
            'text' => $this->prepareProduct($product_id),
            'buttons' => $this->drawBasketButton(
                $begin,
                $basketCount,
                $item,
                $this->totalSumOrder($user_id)),
        ];
    }

    /** Рисуем кнопки корзины
     * @param $begin
     * @param $basketCount
     * @param $item
     * @param $sum
     * @return array
     */
    private function drawBasketButton($begin, $basketCount, $item, $sum)
    {
        // 1 ряд кнопок
        $buttons[][] = $this->buildInlineKeyBoardButton($item['price'] . ' * ' . $item['count'] . ' = ' . ($item['count'] * $item['price']) . " руб.", "basketViewParam_0_0");
        // 2 ряд кнопок для управление количеством товара в корзине
        $buttons[] = [
            $this->buildInlineKeyBoardButton('✖', 'basketRemoveProduct_' . $item['id'] . '_' . $begin),
            $this->buildInlineKeyBoardButton('▼', 'basketCountProduct_0_' . $item['id'] . '_' . $begin),
            $this->buildInlineKeyBoardButton($item['count'], 'basketViewParam_' . $item['count'] . '_0'),
            $this->buildInlineKeyBoardButton('▲', 'basketCountProduct_1_' . $item['id'] . '_' . $begin),
        ];
        // 3 ряд кнопок перелистывание товаров в корзине если товара больше одного
        if ($basketCount > 1) {
            $prev = ($begin == 0) ? $basketCount - 1 : $begin - 1;
            $next = ($basketCount == $begin + 1) ? 0 : $begin + 1;
            $buttons[] = [
                $this->buildInlineKeyBoardButton('<<', 'basketGoProduct_' . $prev),
                $this->buildInlineKeyBoardButton(($begin + 1) . ' из ' . $basketCount, 'basketViewParam_0_' . $basketCount),
                $this->buildInlineKeyBoardButton('>>', 'basketGoProduct_' . $next),
            ];
        }
        // 4 кнопка оформить заказ
        $buttons[][] = $this->buildInlineKeyBoardButton('✔ Оформить - ' . $sum . ' руб.', 'setOrder_0');
        // возвращаем результат
        return $buttons;
    }

    /** Итоговая сумма заказа
     * @param $user_id
     * @return float
     */
    private function totalSumOrder($user_id)
    {
        // получаем все модели из корзины
        $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
        $check->execute(['user_id' => $user_id]);
        // итоговую сумму определяем как ноль
        $total = 0.00;
        // перебираем массив
        while ($model = $check->fetch()) {
            $model_product = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
            $model_product->execute(['id' => $model['product_id']]);
            $product = $model_product->fetch();
            // увеличиваем сумму
            $sum = $product['price'] * $model['product_count'];
            $total += $sum;
        }
        // выводим итог
        return $total;
    }

    /** Подсказки в корзине
     * @param $data
     */
    private function basketViewParam($data)
    {
        // 1- кол-во товара в корзине, 2- общее кол-во товара,
        $param = explode("_", $data['data']);
        // определяем текст подсказки
        if ($param[1]) {
            $text = "Количество товара в корзине";
        } elseif ($param[2]) {
            $text = "Какой по счету товар отображен";
        } else {
            $text = "Расчет суммы по товару";
        }
        // выводим подсказку
        $this->notice($data['id'], $text);
    }

    /** Рисуем корзину inline
     * @param $user_id
     * @param $begin
     * @param $message_id
     */
    private function viewItemBasket($user_id, $begin, $message_id)
    {
        // получаем все из корзины пользователя
        $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
        $check->execute(['user_id' => $user_id]);
        // количество
        $basketCount = $check->rowCount();
        // получаем данные
        $array = $this->drawBasket($user_id, $begin, $basketCount);
        // исменяем сообщение
        $this->botApiQuery("editMessageText", [
            'chat_id' => $user_id,
            'text' => $array['text'],
            'reply_markup' => $this->buildInlineKeyBoard($array['buttons']),
            'parse_mode' => 'html',
            'message_id' => $message_id,
        ]);
    }

    /** Листаем товар в корзине
     * @param $data
     */
    private function basketGoProduct($data)
    {
        // 1 - offset
        $param = explode("_", $data['data']);
        // перенаправляем на отрисовку
        $this->viewItemBasket($this->getChatId($data), $param[1], $data['message']['message_id']);
        // глушим уведомление
        $this->notice($data['id']);
    }

    /** Увеличиваем или уменьшаем количество товара в корзине
     * @param $data
     */
    private function basketCountProduct($data)
    {
        // 1 - тип, 2- id, 3- begin
        $param = explode("_", $data['data']);
        // достаем модель из корзины
        $model_basket = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE id = :id");
        $model_basket->execute(['id' => $param[2]]);
        $basket = $model_basket->fetch();
        // достаем товар
        $product_id = $basket['product_id'];
        $user_id = $this->getChatId($data);
        // если удалять нельзя
        if ($basket['product_count'] == 1 && !$param[1]) {
            // предлагаем пользователю удалить товар
            $text = "Просто удалите товар";
        } else {
            // меняем количество товара
            $count = (!$param[1]) ? $basket['product_count'] - 1 : $basket['product_count'] + 1;
            // сохраняем
            $up_product = $this->pdo->prepare("UPDATE bot_shop_basket SET product_count = :p_count WHERE id = :id");
            if ($up_product->execute(['p_count' => $count, 'id' => $param[2]])) {
                // получаем все из корзины пользователя
                $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
                $check->execute(['user_id' => $user_id]);
                $basketCount = $check->rowCount();
                // достаем модель продукта
                $model_product = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
                $model_product->execute(['id' => $product_id]);
                // получаем полную сумму
                $sum = $this->totalSumOrder($user_id);
                // готовим массив для кнопок корзины
                $item['id'] = $param[2];
                $item['count'] = $count;
                $item['price'] = $model_product->fetch()['price'];
                // получаем кнопки
                $buttons = $this->drawBasketButton(
                    $param[3],
                    $basketCount,
                    $item,
                    $this->totalSumOrder($user_id));
                // меняем клавиатуру
                $this->botApiQuery("editMessageReplyMarkup", [
                    'chat_id' => $user_id,
                    'message_id' => $data['message']['message_id'],
                    'reply_markup' => $this->buildInlineKeyBoard($buttons),
                ]);
                // пишем уведомление
                $text = ($param[1]) ? "Количество увеличено" : "Количество уменьшено";
            } else {
                // выводм ошибку
                $text = "Произошла ошибка";
            }
        }
        // выводим уведомление
        $this->notice($data['id'], $text);
    }

    /** Удаление товара из корзины
     * @param $data
     */
    private function basketRemoveProduct($data)
    {
        // 1- id, 2- begin
        $param = explode("_", $data['data']);
        $user_id = $this->getChatId($data);
        // достаем модель из корзины
        $model_basket = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE id = :id");
        $model_basket->execute(['id' => $param[1]]);
        $basket = $model_basket->fetch();
        // id сообщения
        $message_id = $data['message']['message_id'];
        // удаляем товар из корзины
        $del_product = $this->pdo->prepare("DELETE FROM bot_shop_basket WHERE id = :id");
        if (!$del_product->execute(['id' => $param[1]])) {
            $text = "Произошла ошибка_";
        } else {
            // получаем count из корзины
            $check = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
            $check->execute(['user_id' => $user_id]);
            $basketCount = $check->rowCount();
            // если в корзине что-то есть
            if ($basketCount > 0) {
                // вычисляем бегин
                if ($param[2] == 0) {
                    $num = 0;
                } elseif ($basketCount == $param[2]) {
                    $num = $param[2] - 1;
                } else {
                    $num = $param[2];
                }
                // выводим следующий
                $this->viewItemBasket($this->getChatId($data), $num, $data['message']['message_id']);
            } else {
                // если в корзине пусто
                $text_ = "<b>В вашей корзине не осталось товаров</b>\nПерейдите в /start для начала.";
                // изменяем сообщение
                $this->botApiQuery("editMessageText", [
                    'chat_id' => $user_id,
                    'message_id' => $message_id,
                    'text' => $text_,
                    'parse_mode' => 'html'
                ]);
            }
            // текст для уведомления
            $text = "Товар удален";
        }
        // глушим уведомление
        $this->notice($data['id'], $text);
    }

    /** Начало оформления покупки
     * @param $data
     */
    private function setOrder($data)
    {
        $user_id = $this->getChatId($data);
        if ($this->setActionUser("step_1_phone", $user_id)) {
            // Если удалось записать действие пользователю то отправляем ему запрос на ввод телефона
            $this->insertPhone($user_id, $data);
        } else {
            $this->notice($data['id'], "Ошибка");
        }
    }

    /** Запрос на ввод телефона
     * @param $user_id
     * @param $data
     */
    private function insertPhone($user_id, $data)
    {
        $text = "<b>Оформление заказа</b>\n\n";
        // сумма заказа
        $text .= "Сумма заказа: " . $this->totalSumOrder($user_id) . " рублей";
        // инструкция
        $text .= "\n\nУкажите свой телефон в формате +79001234567:";
        // отправляем данные
        $this->botApiQuery("editMessageText", [
            'chat_id' => $user_id,
            'text' => $text,
            'message_id' => $this->getMessageId($data),
            'parse_mode' => 'html',
        ]);
        // глушим уведомление
        $this->notice($data['id']);
    }

    /** Сохраняем телефон
     * @param $text
     * @param $data
     */
    private function savePhoneUser($text, $data)
    {
        $user_id = $this->getChatId($data);
        // проверяем телефон
        if (preg_match("/^\+[0-9]{9,14}$/i", $text)) {
            if ($this->setActionUser("step_2_adress", $user_id)) {
                if ($this->setParamUser('phone', $text, $user_id)) {
                    $text_ = "<b>Оформление заказа</b>\n\n";
                    // сумма заказа
                    $text_ .= "Сумма заказа: " . $this->totalSumOrder($user_id) . " рублей";
                    // телефон
                    $text_ .= "\nТелефон: " . $text;
                    $text_ .= "\n\nУкажите ваш адрес для доставки:";
                } else {
                    $text_ = "Ошибка попробуйте снова /start";
                }
            } else {
                $text_ = "Ошибка попробуйте еще раз";
            }
        } else {
            $text_ = "Ошибка в веденных данных, попробуйте еще раз.\n\nУкажите свой телефон в формате +79001234567:";
        }
        $this->botApiQuery("sendMessage", [
            'chat_id' => $user_id,
            'text' => $text_,
            'parse_mode' => 'html',
        ]);
    }

    /** Сохраняем адрес
     * @param $text
     * @param $data
     */
    private function saveAdressUser($text, $data)
    {
        $user_id = $this->getChatId($data);
        // Достаем телефон
        $phone = $this->pdo->prepare("SELECT phone FROM bot_shop_profile WHERE user_id = :user_id");
        $phone->execute(['user_id' => $user_id]);

        if ($this->setActionUser("step_3_ready", $user_id)) {
            if ($this->setParamUser('adress', $text, $user_id)) {
                $text_ = "<b>Оформление заказа</b>\n\n";
                // сумма заказа
                $text_ .= "Сумма заказа: " . $this->totalSumOrder($user_id) . " рублей";
                // телефон
                $text_ .= "\nТелефон: " . $phone->fetch()['phone'];
                $text_ .= "\nАдрес для доставки: " . $text;
                $buttons[][] = $this->buildInlineKeyBoardButton('✔ Готово', 'setReady_0');
            } else {
                $text_ = "Ошибка попробуйте снова /start";
            }
        } else {
            $text_ = "Ошибка попробуйте еще раз";
        }
        // готовим данные
        $data_send = [
            'chat_id' => $user_id,
            'text' => $text_,
            'parse_mode' => 'html',
        ];
        // если есть кнопки добавляем
        if (is_array($buttons)) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        }
        // отправляем запрос
        $this->botApiQuery("sendMessage", $data_send);
    }

    /** Оформляем заказ
     * @param $data
     */
    private function setReady($data)
    {
        $user_id = $this->getChatId($data);
        // достаем все из корзины
        $basket = $this->pdo->prepare("SELECT * FROM bot_shop_basket WHERE user_id = :user_id");
        $basket->execute(['user_id' => $user_id]);
        // достаем все от пользователя
        $user = $this->pdo->prepare("SELECT * FROM bot_shop_profile WHERE user_id = :user_id");
        $user->execute(['user_id' => $user_id]);
        // проверяем на количество товаров в корзине
        if ($basket->rowCount() > 0) {
            $userInfo = $user->fetch();
            // готовим данные для записи в таблицу заказов
            $inOrder = $this->pdo->prepare("INSERT INTO bot_shop_order SET user_id = :user_id, date = NOW(), status = 0, name = :name, phone = :phone, adress = :adress");
            if ($inOrder->execute([
                'user_id' => $user_id,
                'name' => trim($userInfo['first_name'] . " " . $userInfo['last_name']),
                'phone' => $userInfo['phone'],
                'adress' => $userInfo['adress'],
            ])) {
                $parent_id = $this->pdo->lastInsertId();
                // записываем товары
                while ($item = $basket->fetch()) {
                    $inOrderProduct = $this->pdo->prepare("INSERT INTO bot_shop_order_product SET parent_id = :parent_id, product_id = :product_id,	product_count = :product_count");
                    $inOrderProduct->execute(['parent_id' => $parent_id, 'product_id' => $item['product_id'], 'product_count' => $item['product_count']]);
                }
                // удаляем из корзины
                $delBasket = $this->pdo->prepare("DELETE FROM bot_shop_basket WHERE user_id = :user_id");
                $delBasket->execute(['user_id' => $user_id]);
                // переадресовать в личный кабинет
                $this->notice($data['id']);
                $this->userLc($user_id, $data['message']['message_id']);
                // уведомляем админа
                $this->botApiQuery("sendMessage", [
                    'chat_id' => $this->admin,
                    'text' => "Поступил новый заказ /orders"
                ]);
            } else {
                $this->notice($data['id'], "Ошибка_", true);
            }
        } else {
            $this->notice($data['id'], "Ошибка", true);
        }
    }

    /** Выводим заказы пользователя
     * @param int $user_id
     * @param int $message_id
     */
    private function userLc($user_id = 0, $message_id = 0)
    {
        // получаем данные
        $array = $this->drawOrder($user_id, 0);
        // готовим для отправки
        $data_send = [
            'chat_id' => !$user_id ? $this->admin : $user_id,
            'text' => $array['text'],
            'parse_mode' => 'html',
        ];
        // если есть кнопки то добавляем
        if (is_array($array['buttons'])) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($array['buttons']);
        }
        // проверяем каким методом будем отправлять
        if ($message_id) {
            $data_send['message_id'] = $message_id;
            $this->botApiQuery("editMessageText", $data_send);
        } else {
            $this->botApiQuery("sendMessage", $data_send);
        }
    }

    /** Чекаем оплату налом
     * @param $data
     */
    private function setNalPay($data)
    {
        // парсим данные
        $user_id = $this->getChatId($data);
        $param = explode("_", $data['data']);
        // меняем флаг
        $order = $this->pdo->prepare("UPDATE bot_shop_order SET type_pay = 1 WHERE id = :order_id");
        $order->execute(['order_id' => $param[1]]);

        // получаем данные
        $array = $this->drawOrder($user_id, 0);
        // готовим для отправки
        $data_send = [
            'chat_id' => $user_id,
            'text' => $array['text'],
            'message_id' => $data['message']['message_id'],
            'parse_mode' => 'html',
        ];
        // если есть кнопки то добавляем
        if (is_array($array['buttons'])) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($array['buttons']);
        }
        $this->botApiQuery("editMessageText", $data_send);
    }

    /** Рисуем заказ
     * @param $user_id
     * @param $begin
     * @return array
     */
    private function drawOrder($user_id = 0, $begin = 0)
    {
        if (!$user_id) {
            $dop_user_id = "";
            $dop_user_arr = [];
        } else {
            $dop_user_id = " WHERE user_id = :user_id ";
            $dop_user_arr = ['user_id' => $user_id];
        }
        // достаем из корзины товар
        $order = $this->pdo->prepare("SELECT * FROM bot_shop_order " . $dop_user_id . " ORDER BY id DESC LIMIT " . $begin . ", 1");
        $order->execute($dop_user_arr);
        if ($order->rowCount() > 0) {
            $orderRaw = $order->fetch();
            // считаем общуюю сумму
            $orderProduct = $this->pdo->prepare("SELECT * FROM bot_shop_order_product WHERE parent_id = :parent_id");
            $orderProduct->execute(['parent_id' => $orderRaw['id']]);
            // итоговую сумму определяем как ноль
            $total = 0.00;
            $goods = "";

            // перебираем массив
            while ($row = $orderProduct->fetch()) {
                $model_product = $this->pdo->prepare("SELECT * FROM bot_shop_product WHERE id = :id");
                $model_product->execute(['id' => $row['product_id']]);
                $product = $model_product->fetch();
                // увеличиваем сумму
                $sum = $product['price'] * $row['product_count'];
                $total += $sum;
                // складываем товары
                $goods .= " -- " . $product['name'] . " = " . $row['product_count'] . " " . $product['unit'] . " x " . $product['price'] . "\n";
            }
            // готовим данные
            $text = "<b>Заказ от</b> " . $orderRaw['date'] . "\n";
            $text .= "<b>Сумма заказа:</b> " . $total . " рублей\n";
            $text .= "<b>Телефон:</b> " . $orderRaw['phone'] . "\n";
            $text .= "<b>Адрес:</b> " . $orderRaw['adress'] . "\n";

            if (!$user_id) {
                $user_data = $this->pdo->prepare("SELECT * FROM bot_shop_profile WHERE user_id = :user_id");
                $user_data->execute(['user_id' => $orderRaw['user_id']]);
                $user_data_raw = $user_data->fetch();
                $text .= "<b>Пользователь:</b> " . trim($user_data_raw['first_name'] . " " . $user_data_raw['last_name']) . "\n";
            }

            if ($orderRaw['type_pay']) {
                $text .= "<b>Оплата:</b> наличными при получении\n";
            }

            $text .= "<b>Товары</b>: \n" . $goods;



            if (!$orderRaw['status']) {
                if (!$orderRaw['type_pay'] && $user_id) {
                    // готовим кнопку для перехода в Яндекс.Деньги
                    $url = $this->getUrl($total, $user_id, $orderRaw['id']);
                    $buttons[][] = $this->buildInlineKeyBoardButton('Оплатить онлайн', '', $url);
                    $buttons[][] = $this->buildInlineKeyBoardButton('Оплатить наличными при получении', 'setNalPay_' . $orderRaw['id'] . '_' . $begin);
                }
            } else {
                // если заказ оплачен то уведомляем
                $text .= "\n<b>Заказ оплачен</b>\n";
            }



            // проверяем количество заказов пользователя
            $orderCount = $this->pdo->prepare("SELECT * FROM bot_shop_order " . $dop_user_id);
            $orderCount->execute($dop_user_arr);
            $count = $orderCount->rowCount();
            // проверяем на количество
            if ($count > 1) {
                $prev = ($begin == 0) ? $count - 1 : $begin - 1;
                $next = ($count == $begin + 1) ? 0 : $begin + 1;
                // выводим навигацию
                $buttons[] = [
                    $this->buildInlineKeyBoardButton('<< Назад', 'orderGo_' . $prev . '_' . $user_id),
                    $this->buildInlineKeyBoardButton('Вперед >>', 'orderGo_' . $next . '_' . $user_id),
                ];
            }
        } else {
            $text = "Нет заказов для отображения /start";
            $buttons = "";
        }
        // возвращаем данные
        return [
            'text' => $text,
            'buttons' => $buttons,
        ];
    }

    /** Листаем заказы
     * @param $data
     */
    private function orderGo($data)
    {
        $param = explode("_", $data['data']);
        if (!$param[2]) {
            $user_id = $this->admin;
        } else {
            $user_id = $this->getChatId($data);
        }
        // получаем данные
        $array = $this->drawOrder($param[2], $param[1]);
        // готовим для отправки
        $data_send = [
            'chat_id' => $user_id,
            'message_id' => $data['message']['message_id'],
            'text' => $array['text'],
            'parse_mode' => 'html',
        ];
        // если есть кнопки то добавляем
        if (is_array($array['buttons'])) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($array['buttons']);
        }
        // отправляем данные
        $this->botApiQuery("editMessageText", $data_send);
        $this->notice($data['id']);
    }

    /** Получаем действие пользователя из таблицы
     * @return bool
     */
    private function getUserAction($user_id)
    {
        // достаем из базы
        $last = $this->pdo->prepare("SELECT action FROM bot_shop_profile WHERE user_id = :user_id");
        $last->execute(['user_id' => $user_id]);
        // преобразуем строку в массив
        $lastAction = $last->fetch();
        // если есть значение то возвращаем его иначе false
        return !empty($lastAction['action']) ? $lastAction['action'] : false;
    }

    /** Записываем действие пользователя
     * @param $action
     * @return mixed
     */
    private function setActionUser($action, $user_id)
    {
        // готовим запрос
        $insertSql = $this->pdo->prepare("UPDATE bot_shop_profile SET action = :action WHERE user_id = :user_id");
        // возвращаем результат
        return $insertSql->execute(['action' => $action, 'user_id' => $user_id]);
    }

    /** Записываем действие админа
     * @param $param
     * @param $value
     * @param $user_id
     * @return bool
     */
    private function setParamUser($param, $value, $user_id)
    {
        // готовим запрос
        $insertSql = $this->pdo->prepare("UPDATE bot_shop_profile SET " . $param . " = :value WHERE user_id = :user_id");
        // возвращаем результат
        return $insertSql->execute(['value' => $value, 'user_id' => $user_id]);
    }



    /** Формируем ссылку для оплаты
     * @param $sum
     * @param $user_id
     * @param $order_id
     * @return string
     */
    private function getUrl($sum, $user_id, $order_id)
    {
        return "https://money.yandex.ru/quickpay/confirm.xml?receiver=" . $this->receiver
            . "&quickpay-form=shop&targets=" . urlencode($this->nameShop)
            . "&paymentType=AC&sum=" . $sum
            . "&label=" . $user_id . ":" . $order_id . ":" . md5(rand(0, 1000))
            . "&comment=" . urlencode("Оплата заказа #" . $order_id)
            . "&successURL=" . $this->urlBot;
    }


    /** выводим заказы
     */
    private function showOrders()
    {
        $this->userLc();
    }

    //////////////////////////////////
    // Вспомогательные методы
    //////////////////////////////////
    /**
     *  Создаем соединение с БД
     */
    private function setPdo()
    {
        // задаем тип БД, хост, имя базы данных и чарсет
        $dsn = "mysql:host=$this->host;dbname=$this->db;charset=$this->charset";
        // дополнительные опции
        $opt = [
            // способ обработки ошибок - режим исключений
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            // тип получаемого результата по-умолчанию - ассоциативный массив
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            // отключаем эмуляцию подготовленных запросов
            PDO::ATTR_EMULATE_PREPARES => false,
            // определяем кодировку запросов
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci"
        ];
        // записываем объект PDO в свойство $this->pdo
        $this->pdo = new PDO($dsn, $this->user, $this->pass, $opt);
    }

    /** проверяем на админа
     * @param $chat_id
     * @return bool
     */
    private function isAdmin($chat_id)
    {
        // возвращаем true или fasle
        return $chat_id == $this->admin;
    }

    /** Получаем id чата
     * @param $data
     * @return mixed
     */
    private function getChatId($data)
    {
        if ($this->getType($data) == "callback_query") {
            return $data['callback_query']['message']['chat']['id'];
        }
        return $data['message']['chat']['id'];
    }

    /** Получаем id сообщения
     * @param $data
     * @return mixed
     */
    private function getMessageId($data)
    {
        if ($this->getType($data) == "callback_query") {
            return $data['callback_query']['message']['message_id'];
        }
        return $data['message']['message_id'];
    }

    /** получим значение текст
     * @return mixed
     */
    private function getText($data)
    {
        if ($this->getType($data) == "callback_query") {
            return $data['callback_query']['data'];
        }
        return $data['message']['text'];
    }

    /** Узнаем какой тип данных пришел
     * @param $data
     * @return bool|string
     */
    private function getType($data)
    {
        if (isset($data['callback_query'])) {
            return "callback_query";
        } elseif (isset($data['message']['text'])) {
            return "message";
        } elseif (isset($data['message']['photo'])) {
            return "photo";
        } else {
            return false;
        }
    }

    /** Кнопка inline
     * @param $text
     * @param string $callback_data
     * @param string $url
     * @return array
     */
    public function buildInlineKeyboardButton($text, $callback_data = '', $url = '')
    {
        // рисуем кнопке текст
        $replyMarkup = [
            'text' => $text,
        ];
        // пишем одно из обязательных дополнений кнопке
        if ($url != '') {
            $replyMarkup['url'] = $url;
        } elseif ($callback_data != '') {
            $replyMarkup['callback_data'] = $callback_data;
        }
        // возвращаем кнопку
        return $replyMarkup;
    }

    /** набор кнопок inline
     * @param array $options
     * @return string
     */
    public function buildInlineKeyBoard(array $options)
    {
        // собираем кнопки
        $replyMarkup = [
            'inline_keyboard' => $options,
        ];
        // преобразуем в JSON объект
        $encodedMarkup = json_encode($replyMarkup, true);
        // возвращаем клавиатуру
        return $encodedMarkup;
    }

    /** кнопка клавиатуры
     * @param $text
     * @param bool $request_contact
     * @param bool $request_location
     * @return array
     */
    public function buildKeyboardButton($text, $request_contact = false, $request_location = false)
    {
        $replyMarkup = [
            'text' => $text,
            'request_contact' => $request_contact,
            'request_location' => $request_location,
        ];
        return $replyMarkup;
    }

    /** готовим набор кнопок клавиатуры
     * @param array $options
     * @param bool $onetime
     * @param bool $resize
     * @param bool $selective
     * @return string
     */
    public function buildKeyBoard(array $options, $onetime = false, $resize = false, $selective = true)
    {
        $replyMarkup = [
            'keyboard' => $options,
            'one_time_keyboard' => $onetime,
            'resize_keyboard' => $resize,
            'selective' => $selective,
        ];
        $encodedMarkup = json_encode($replyMarkup, true);
        return $encodedMarkup;
    }

    //////////////////////////////////
    // Взаимодействие с Бот Апи
    //////////////////////////////////
    /** Отправляем текстовое сообщение с inline кнопками
     * @param $user_id
     * @param $text
     * @param null $buttons
     * @return mixed
     */
    private function sendMessage($user_id, $text, $buttons = NULL)
    {
        // готовим массив данных
        $data_send = [
            'chat_id' => $user_id,
            'text' => $text,
            'parse_mode' => 'html'
        ];
        // если переданны кнопки то добавляем их к сообщению
        if (!is_null($buttons) && is_array($buttons)) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        }
        // отправляем текстовое сообщение
        return $this->botApiQuery("sendMessage", $data_send);
    }

    /** Меняем содержимое сообщения
     * @param $user_id
     * @param $message_id
     * @param $text
     * @param null $buttons
     * @return mixed
     */
    private function editMessageText($user_id, $message_id, $text, $buttons = NULL)
    {
        // готовим массив данных
        $data_send = [
            'chat_id' => $user_id,
            'text' => $text,
            'message_id' => $message_id,
            'parse_mode' => 'html'
        ];
        // если переданны кнопки то добавляем их к сообщению
        if (!is_null($buttons) && is_array($buttons)) {
            $data_send['reply_markup'] = $this->buildInlineKeyBoard($buttons);
        }
        // отправляем текстовое сообщение
        return $this->botApiQuery("editMessageText", $data_send);
    }


    /** Уведомление в клиенте
     * @param $cbq_id
     * @param $text
     * @param bool $type
     */
    private function notice($cbq_id, $text = "", $type = false)
    {
        $data = [
            'callback_query_id' => $cbq_id,
            'show_alert' => $type,
        ];

        if (!empty($text)) {
            $data['text'] = $text;
        }

        $this->botApiQuery("answerCallbackQuery", $data);
    }

    /** Запрос к BotApi
     * @param $method
     * @param array $fields
     * @return mixed
     */
    private function botApiQuery($method, $fields = array())
    {
        $ch = curl_init('https://api.telegram.org/bot' . $this->token . '/' . $method);
        curl_setopt_array($ch, array(
            CURLOPT_POST => count($fields),
            CURLOPT_POSTFIELDS => http_build_query($fields),
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_TIMEOUT => 10
        ));
        $r = json_decode(curl_exec($ch), true);
        curl_close($ch);
        return $r;
    }
}
