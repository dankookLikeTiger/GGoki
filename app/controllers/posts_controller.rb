class PostsController < ApplicationController
  before_action :require_login
    def new
      #사용자가 데이터를 입력할 화면
      #자동으로 액션 이름과 같은 화면을 불러서 사용자에게 보여줘라.
    end
    
    # 입력받은 데이터를 실제 DB 저장할 액션.
    def create
       # puts params
       @post = Post.new    
       @post.title = params[:input_title]
       @post.content = params[:input_content]
      
       @post.user = current_user
       
       uploader= CruduploaderUploader.new
       
       fileup= params[:pic]
       
       uploader.store!(fileup)
       
       @post.image_url = uploader
       
       flash[:notice] = "전송되었습니다!"
       

       @post.save
       
       redirect_to "/posts/show/#{@post.id}"
      
      
      


    end
    
    #모든 포스트들을 보여주는 view
    def index   
      @posts= Post.all
    end
   #한개의 포스트를 보여주는 view
    def show
      @post= Post.find(params[:post_id])
      @comments=Comment.where(post_id: params[:post_id])
    end
    
    def edit
      @post= Post.find(params[:post_id])
    
    end
    
    
    def update
       @post= Post.find(params[:post_id])
       
       #수정할 코드
       
       @post.title = params[:input_title]
       @post.content = params[:input_content]
        
       @post.save
       
       redirect_to "/posts/show/#{@post.id}"
         
    end
    
    #한 개의 포스트를 삭제하는 view
    def destroy
      @post = Post.find(params[:post_id])
      @post.destroy
      redirect_to '/'
    end
end
