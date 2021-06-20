<!doctype html>
<html lang="en">
<head>
    <% base_tag %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta property="og:url" content="$AbsoluteLink" />
    <meta property="og:type" content="website" />
    <link rel="canonical" href="$AbsoluteLink"/>

    $MetaTags(false)
    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %></title>
</head>
<body>
    <div>
        <% include Header %>

        $Layout

        <%-- Ajax form example --%>
        <form
            @submit.prevent="axios.post('$Link('Subscribe')', fields).then(function(res) {
                if (res.data.errors) {
                    errors = res.data.errors;
                } else {
                    clear();
                    message = res.data.message;
                    errors = {};
                }
            })"
            x-data="{
                fields: {
                    FirstName: '',
                    Surname: '',
                    Email: '',
                },
                errors: {},
                message: '',
                clear() { Object.keys(this.fields).forEach(field => this.fields[field] = '') }
            }"
        >
            <ul x-show="Object.values(errors).length" class="text-red-500">
                <div class="font-bold">Oops! We found some errors.</div>
                <template x-for="error in Object.values(errors)">
                    <li x-text="error"></li>
                </template>
            </ul>

            <label for="FirstName">
                First name
                <input type="text" name="FirstName" id="FirstName" x-model="fields.FirstName">
                <div x-show="errors.FirstName" x-text="errors.FirstName" class="text-red-500 text-sm font-bold"></div>
            </label>
            <label for="Surname">
                Last name
                <input type="text" name="Surname" id="Surname" x-model="fields.Surname">
                <div x-show="errors.Surname" x-text="errors.Surname" class="text-red-500 text-sm font-bold"></div>
            </label>
            <label for="Email">
                Email
                <input type="email" name="Email" id="Email" x-model="fields.Email">
                <div x-show="errors.Email" x-text="errors.Email" class="text-red-500 text-sm font-bold"></div>
            </label>

            <button type="submit">Submit</button>
            <div x-show="message" x-text="message" class="font-bold text-green-400"></div>
        </form>
        <%-- /Ajax form example --%>

        <%-- Dropdown component example --%>
        <div x-data="{ open: false }" class="relative">
            <button
                type="button"
                class="text-gray-600 p-2 rounded border border-gray-300 bg-white hover:bg-gray-100 focus:bg-gray-100 focus:border-gray-500 focus:outline-none transition-all"
                @click="open = !open"
            >
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
            </button>
            <ul
                x-show="open"
                @click.outside="open = false"
                class="bg-white border border-gray-300 rounded space-y-4 shadow-md p-6 absolute left-0 top-full mt-1 min-w-[250px]"
                x-transition.duration.300ms
            >
                <% loop $Menu(1) %>
                    <li class="<% if not $Last %>border-b border-gray-300 pb-4<% end_if %>">
                        <a class="hover:text-gray-500 transition" href="$Link">$MenuTitle</a>
                    </li>
                <% end_loop %>
            </ul>
        </div>
        <%-- /Dropdown component example --%>

        <% include Footer %>
    </div>
</body>
</html>
