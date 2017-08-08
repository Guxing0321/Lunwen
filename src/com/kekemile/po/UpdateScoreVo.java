package com.kekemile.po;

/**
 * 
 * 根据论文的email信息修改用户的分数
 * 
 * @author guxing
 *
 */
public class UpdateScoreVo {

	private String email;
	private float score;

	public UpdateScoreVo() {
		super();
	}

	public UpdateScoreVo(String email, float score) {
		super();
		this.email = email;
		this.score = score;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "UpdateScoreVo [email=" + email + ", score=" + score + "]";
	}

}
