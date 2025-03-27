import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view가 load 되었을 때 configureUI 함수 실행
        configureUI()
    }
    
    private func configureUI() {
        // UILabel 속성
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        // view에 노출
        [label]
            .forEach { view.addSubview($0) }
        
        // autolayout 설정
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
            
        }
    }
}
