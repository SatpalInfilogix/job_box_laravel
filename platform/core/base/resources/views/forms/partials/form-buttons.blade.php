@php
    do_action(BASE_ACTION_FORM_ACTIONS, 'default');
@endphp

<div class="btn-list">
    {{ request()->route('id') }}
    @if (Route::is('companies.edit'))

    @php
    $college = request()->route('company');
    if($college){
        $college_id = json_decode($college)->id;
    }
    @endphp
        <a href="{{ route('college.pages.create', ['college'=> $college_id]) }}" class="btn btn-primary">Add new page</a>
    @endif
    <x-core::button
        type="submit"
        value="apply"
        name="submitter"
        color="primary"
        icon="ti ti-device-floppy"
    >
        {{ trans('core/base::forms.save_and_continue') }}
    </x-core::button>

    @if (!isset($onlySave) || !$onlySave)
        <x-core::button
            type="submit"
            name="submitter"
            value="save"
            :icon="$saveIcon ?? 'ti ti-transfer-in'"
        >
        {{ $saveTitle ?? trans('core/base::forms.save') }}
        </x-core::button>
    @endif

    {!! apply_filters('base_action_form_actions_extra', null) !!}
</div>
