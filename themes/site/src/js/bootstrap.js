import Axios from 'axios';
import Alpine from 'alpinejs';

/** Apply Axios to window and set smart defaults */
window.axios = Axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/** Apply Alpine to window and initiate */
window.alpine = Alpine;
Alpine.start();
