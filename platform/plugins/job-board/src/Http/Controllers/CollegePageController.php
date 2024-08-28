<?php

namespace Botble\JobBoard\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\Assets;
use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Supports\Breadcrumb;
use Botble\JobBoard\Http\Requests\AjaxCompanyRequest;
use Botble\JobBoard\Http\Requests\CompanyRequest;
use Botble\JobBoard\Http\Resources\CompanyResource;
use Botble\JobBoard\Models\Company;
use Botble\JobBoard\Services\StoreCompanyAccountService;
use Botble\Page\Tables\CollegePageTable;
use Botble\Page\Forms\PageForm;

class CollegePageController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/job-board::company.name'), route('companies.index'));
    }

    public function index(CollegePageTable $pageTable, $college)
    {      
        $pageTable->setCollege($college);
        $pageTable->setup();
        $this->pageTitle(trans('plugins/job-board::college.name'));

        return $pageTable->renderTable();
    }

    public function create($college){
        $this->pageTitle(trans('packages/page::pages.create'));

        return PageForm::create()->renderForm();
    }

}
