<?php

namespace Botble\JobBoard\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Botble\ACL\Traits\SendsPasswordResetEmails;
use Botble\JobBoard\Forms\Fronts\Auth\ForgotPasswordForm;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Password;

class ForgotPasswordController extends Controller
{
    use SendsPasswordResetEmails;

    public function showLinkRequestForm()
    {
        SeoHelper::setTitle(__('Forgot Password'));

        Theme::breadcrumb()->add(__('Forgot Password'), route('public.account.register'));

        return Theme::scope('job-board.auth.passwords.email', ['form' => ForgotPasswordForm::create()], 'plugins/job-board::themes.auth.passwords.email')->render();
    }

    public function broker()
    {
        return Password::broker('accounts');
    }
}
