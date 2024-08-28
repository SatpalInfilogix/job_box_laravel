<?php

namespace Botble\JobBoard\Forms\Fronts\Auth;

use Botble\Base\Forms\FormAbstract;
use Botble\JobBoard\Forms\Fronts\Auth\Concerns\HasSubmitButton;
use Botble\Theme\Facades\Theme;

abstract class AuthForm extends FormAbstract
{
    use HasSubmitButton;

    public function setup(): void
    {
        Theme::asset()->add('auth-css', 'vendor/core/plugins/job-board/css/front-auth.css');

        $this->contentOnly()
            ->setFormOption('class', 'auth-form');
    }
}
