package net.eoutech.webmin;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;

/**
 * @url http://download.csdn.net/detail/leasystu/4308246
 *
 * @author Easy
 */
public class PerformanceTest extends JFrame {
    public static final int WIDTH = 800, HEIGHT = 600, SLEEPTIME = 100, L = 1,
            R = 2, U = 3, D = 4;
    BufferedImage offersetImage = new BufferedImage(WIDTH, HEIGHT,
            BufferedImage.TYPE_3BYTE_BGR);;
    Rectangle rect = new Rectangle(20, 40, 15 * 50, 15 * 35);
    Snake snake;
    Node node;

    public PerformanceTest() {
        snake = new Snake(this);
        createNode();
        this.setBounds(100, 100, WIDTH, HEIGHT);
        this.addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent arg0) {
                System.out.println(arg0.getKeyCode());
                switch (arg0.getKeyCode()) {
                    case KeyEvent.VK_LEFT:
                        snake.dir = L;
                        break;
                    case KeyEvent.VK_RIGHT:
                        snake.dir = R;
                        break;
                    case KeyEvent.VK_UP:
                        snake.dir = U;
                        break;
                    case KeyEvent.VK_DOWN:
                        snake.dir = D;
                }
            }
        });
        this.setTitle("贪吃蛇 0.1   By ： Easy");
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setVisible(true);
        new Thread(new ThreadUpadte()).start();
    }

    public void paint(Graphics g) {
        Graphics2D g2d = (Graphics2D) offersetImage.getGraphics();
        g2d.setColor(Color.white);
        g2d.fillRect(0, 0, WIDTH, HEIGHT);
        g2d.setColor(Color.black);
        g2d.drawRect(rect.x, rect.y, rect.width, rect.height);
        if (snake.hit(node)) {
            createNode();
        }
        snake.draw(g2d);
        node.draw(g2d);
        g.drawImage(offersetImage, 0, 0, null);
    }

    class ThreadUpadte implements Runnable {
        public void run() {
            while (true) {
                try {
                    Thread.sleep(SLEEPTIME);
                    repaint();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void createNode() {
        int x = (int) (Math.random() * 650) + 50, y = (int) (Math.random() * 500) + 50;
        Color color = Color.blue;
        node = new Node(x, y, color);
    }

    public static void main(String args[]) {
        new PerformanceTest();
    }
}

class Node {
    int x, y, width = 15, height = 15;
    Color color;

    public Node(int x, int y, Color color) {
        this(x, y);
        this.color = color;
    }

    public Node(int x, int y) {
        this.x = x;
        this.y = y;
        this.color = color.black;
    }

    public void draw(Graphics2D g2d) {
        g2d.setColor(color);
        g2d.drawRect(x, y, width, height);
    }

    public Rectangle getRect() {
        return new Rectangle(x, y, width, height);
    }
}

class Snake {
    public List<Node> nodes = new ArrayList<Node>();
    PerformanceTest interFace;
    int dir = PerformanceTest.R;

    public Snake(PerformanceTest interFace) {
        this.interFace = interFace;
        nodes.add(new Node(20 + 150, 40 + 150));
        addNode();
    }

    public boolean hit(Node node) {
        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).getRect().intersects(node.getRect())) {
                addNode();
                return true;
            }
        }
        return false;
    }

    public void draw(Graphics2D g2d) {
        for (int i = 0; i < nodes.size(); i++) {
            nodes.get(i).draw(g2d);
        }
        move();
    }

    public void move() {
        nodes.remove((nodes.size() - 1));
        addNode();
    }

    public synchronized void addNode() {
        Node nodeTempNode = nodes.get(0);
        switch (dir) {
            case PerformanceTest.L:
                if (nodeTempNode.x <= 20) {
                    nodeTempNode = new Node(20 + 15 * 50, nodeTempNode.y);
                }
                nodes.add(0, new Node(nodeTempNode.x - nodeTempNode.width,
                        nodeTempNode.y));
                break;
            case PerformanceTest.R:
                if (nodeTempNode.x >= 20 + 15 * 50 - nodeTempNode.width) {
                    nodeTempNode = new Node(20 - nodeTempNode.width, nodeTempNode.y);
                }
                nodes.add(0, new Node(nodeTempNode.x + nodeTempNode.width,
                        nodeTempNode.y));
                break;
            case PerformanceTest.U:
                if (nodeTempNode.y <= 40) {
                    nodeTempNode = new Node(nodeTempNode.x, 40 + 15 * 35);
                }
                nodes.add(0, new Node(nodeTempNode.x, nodeTempNode.y
                        - nodeTempNode.height));
                break;
            case PerformanceTest.D:
                if (nodeTempNode.y >= 40 + 15 * 35 - nodeTempNode.height) {
                    nodeTempNode = new Node(nodeTempNode.x,
                            40 - nodeTempNode.height);
                }
                nodes.add(0, new Node(nodeTempNode.x, nodeTempNode.y
                        + nodeTempNode.height));
                break;
        }
    }
}