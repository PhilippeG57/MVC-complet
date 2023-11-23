<?php
    class Posts extends Controller {
        public function __construct(){
            if(!isLoggedIn()){
              redirect('users/login');
            }
      
            $this->postModel = $this->model('Post');
            $this->userModel = $this->model('User');
          }
      
          public function index(){
            // Get posts
            $posts = $this->postModel->getPosts();
      
            $data = [
              'posts' => $posts
            ];
      
            $this->view('posts/index', $data);
          }

        public function add(){
             // check for POST
             if($_SERVER['REQUEST_METHOD'] == 'POST'){
                //Sanitize POST date
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

                //Init data
                $data=[
                    'title' => trim($_POST['title']),
                    'body' => trim($_POST['body']),
                    'user_id' => $_SESSION['user_id'],
                    'title_err' => '',
                    'body_err' => ''
                ];

                //Validate data
                if(empty($data['title'])){
                    $data['title_err'] = 'Veuillez entrer un titre';
                }
                if(empty($data['body'])){
                    $data['body_err'] = 'Veuillez entrer un corps de texte';
                }

                // Make sure no errors
                if(empty($data['title_err']) && empty($data['body_err'])){
                    //Validated
                    if($this->postModel->addPost($data)){
                        flash('post_message', 'Post publié');
                        redirect('posts');
                    }else{
                        die('Something went wrong');
                    }
                }else{
                    // Load view with errors
                    $this->view('posts/add', $data);
                }
            }else{
                $data = [
                    'title' => '',
                    'body'  => ''
                ];

                $this->view('posts/add', $data);
            }
        }

        public function edit($id){
            // check for POST
            if($_SERVER['REQUEST_METHOD'] == 'POST'){
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

                $data=[
                    'id' => $id,
                    'title' => trim($_POST['title']),
                    'body' => trim($_POST['body']),
                    'user_id' => $_SESSION['user_id'],
                    'title_err' => '',
                    'body_err' => ''
                ];

                //Validate data
                if(empty($data['title'])){
                    $data['title_err'] = 'Veuillez entrer un titre';
                }
                if(empty($data['body'])){
                    $data['body_err'] = 'Veuillez entrer un corps de texte';
                }

                // Make sure no errors
                if(empty($data['title_err']) && empty($data['body_err'])){
                    //Validated
                    if($this->postModel->updatePost($data)){
                        flash('post_message', 'Post mis à jour');
                        redirect('posts');
                    }else{
                        die('Something went wrong');
                    }
                }else{
                    // Load view with errors
                    $this->view('posts/edit', $data);
                }
            } else {
                // Get existing post from model
                $post = $this->postModel->getPostById($id);

                //check for owner
                if($post->user_id != $_SESSION['user_id']){
                    redirect('posts');
                }

                $data = [
                    'id' => $id,
                    'title' => $post->title,
                    'body' => $post->body
                ];

                $this->view('posts/edit', $data);
            }
        }

        public function show($id){
            $post = $this->postModel->getPostById($id);
            $user = $this->userModel->getUserById($post->user_id);

            $data = [
                'post' => $post,
                'user' => $user
            ];

            $this->view('posts/show', $data);
        }

        public function delete($id){
                // Get existing post from model
                $post = $this->postModel->getPostById($id);

                // Check for owner
                if($post->user_id != $_SESSION['user_id']){
                    redirect('posts');
                }

                if($this->postModel->deletePost($id)){
                    flash('post_message', 'Post Removed');
                    redirect('posts');
                  } else {
                    die('Something went wrong');
                  }
        }

    }