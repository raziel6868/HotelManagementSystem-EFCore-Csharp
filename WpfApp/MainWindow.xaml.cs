using Repositories;
using System.Windows;
using Microsoft.Extensions.Configuration;

namespace WpfApp
{
    public partial class MainWindow : Window
    {
        private readonly string emailConfig;
        private readonly string passwordConfig;
        private readonly ICustomerRepository _customerRepository;

        public MainWindow(IConfiguration configuration, ICustomerRepository customerRepository)
        {
            InitializeComponent();
            _customerRepository = customerRepository;
            emailConfig = configuration["AdminAccount:Email"];
            passwordConfig = configuration["AdminAccount:Password"];
        }

        // ... rest of the class remains the same
    }
}