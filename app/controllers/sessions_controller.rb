class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面===>重定向到友好界面
      log_in user
      # remember user
      # 处理提交的“记住我”复选框
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # redirect_to user
      redirect_back_or user
    else
      # 创建一个错误消息
      # flash[:danger] = 'Invalid email/password combination' # 不完全正确
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
