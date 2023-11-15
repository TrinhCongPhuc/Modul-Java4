package ra.academy.serviceimpl;

import ra.academy.model.Customer;
import ra.academy.service.ICustomerService;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CustomerService implements ICustomerService {
    private List<Customer> customers = new ArrayList<>();
    public CustomerService() {
        SimpleDateFormat sim = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Customer c1 = new Customer(1L,"Hồ Xuân Hùng","hunghx@gmail.com","0987635547",true,sim.parse("18/06/1999"),"no pain no gain","https://anhdep123.com/wp-content/uploads/2021/02/anh-avatar-hai-huoc.jpg");
            Customer c2 = new Customer(2L,"Trịnh Công Phúc","phuccp@gmail.com","0974533547",true,sim.parse("20/10/1981"),"Another day another dollar","https://banner2.cleanpng.com/20180511/rtw/kisspng-aang-avatar-the-last-airbender-korra-zuko-katara-5af58980e3c5a9.453987671526040960933.jpg");
            Customer c3 = new Customer(3L,"Cao Cường","cuongcc@gmail.com","0996475463",false,sim.parse("11/11/2004"),"play boy","https://i.9mobi.vn/cf/Images/tt/2021/8/20/anh-avatar-dep-54.jpg");
            customers.add(c1);
            customers.add(c2);
            customers.add(c3);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public Optional<Customer> findById(Long id) {
        return customers.stream().filter(c->c.getId()==id).findFirst();
    }

    @Override
    public void save(Customer customer) {
        Customer oldCus  = findById(customer.getId()).orElse(null);
        if(oldCus !=null){
            // sửa
            customers.set(customers.indexOf(oldCus),customer);
        }else {
            // thêm mới
            customers.add(customer);
        }
    }

    @Override
    public void deleteById(Long id) {
        findById(id).ifPresent(cus->{
            // consumer - functional interface dạng gì
            // void accept(T t)
            customers.remove(cus);
        });
    }
}
