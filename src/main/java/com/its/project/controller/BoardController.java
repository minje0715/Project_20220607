package com.its.project.controller;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.PageDTO;
import com.its.project.service.BoardService;
import com.its.project.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping ("/save")
    public String saveForm() {
        return "boardPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
    boolean saveResult = boardService.save(boardDTO);
    if(saveResult) {
        return "redirect:/board/findAll";
    }else {
        return "save-fail";
    }
    }

    @GetMapping("/findAll")
    public String findAll(Model model, @RequestParam(value="page", required = false,
            defaultValue = "1") int page) {
        List<BoardDTO> boardDTOList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", paging);
        return "boardPages/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long bid, Model model, @RequestParam(value="page", required = false,
            defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(bid);
        model.addAttribute("page", page);
        model.addAttribute("board", boardDTO);
        model.addAttribute("commentList", commentService.findAll(bid));
        return "boardPages/findById";
    }

    @GetMapping ("/update")
    public String update(@RequestParam("id")Long bid, Model model ) {
        BoardDTO boardDTO = boardService.findById(bid);
        model.addAttribute("boardUpdate", boardDTO);
        return "boardPages/update";
    }
    @PostMapping ("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/findAll";
    }
    @GetMapping ("/delete")
    public String delete(@RequestParam("id")Long bid){
        boardService.delete(bid);
        return "redirect:/board/findAll";
    }

}
