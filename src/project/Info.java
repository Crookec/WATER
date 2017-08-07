package project;

public class Info {
	
	public Info(){
		this.set_O2(0);//溶解氧
		this.set_NHN(0);//氨氮
		this.set_ph(0);//pH
		this.set_t(0);//温度
		this.set_addo(0);//增氧机
		this.set_heat(0);//加热
		this.set_ex(0);//异常代码
	}
	
	public Info(String time,double O2,double NHN,double ph,double t,int addo,int heat,int ex){
		this.set_time(time);//时间,
		this.set_O2(O2);//溶解氧
		this.set_NHN(NHN);//氨氮
		this.set_ph(ph);//pH
		this.set_t(t);//温度
		this.set_addo(addo);//增氧机
		this.set_heat(heat);//加热
		this.set_ex(ex);//异常代码
	}
	
	private double _O2,_NHN,_ph,_t;
	private int _addo,_heat,_ex;
	private String _time;
	
	public String get_time() {
		return _time;
	}

	public void set_time(String _time) {
		this._time = _time;
	}

	public double get_O2() {
		return _O2;
	}

	public void set_O2(double _O2) {
		this._O2 = _O2;
	}

	public double get_NHN() {
		return _NHN;
	}

	public void set_NHN(double _NHN) {
		this._NHN = _NHN;
	}

	public double get_ph() {
		return _ph;
	}

	public void set_ph(double _ph) {
		this._ph = _ph;
	}

	public double get_t() {
		return _t;
	}

	public void set_t(double _t) {
		this._t = _t;
	}

	public int get_addo() {
		return _addo;
	}

	public void set_addo(int _addo) {
		this._addo = _addo;
	}

	public int get_heat() {
		return _heat;
	}

	public void set_heat(int _heat) {
		this._heat = _heat;
	}

	public int get_ex() {
		return _ex;
	}

	public void set_ex(int _ex) {
		this._ex = _ex;
	}
}
