//export default {

//    install: (Vue) => {

//        Vue.prototype.$company = {

//            saveCompany: function () {
//                alert('Company Saved.');
//            }

//        };

//    }

//};

module.exports = {

        install(Vue, options) {
            // We call Vue.mixin() here to inject functionality into all components.
            Vue.mixin({
                // Anything added to a mixin will be injected into all components.
                // In this case, the mounted() method runs when the component is added to the DOM.
                mounted() {
                    console.log('Mounted!');
                },

                methods: {
                    saveCompany: function () {
                        alert('Company Saved');
                    }
                }
            });
        }

};